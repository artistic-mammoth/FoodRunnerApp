//
//  LazyImageView.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import UIKit

final class LazyImageView: UIImageView {
    // MARK: - ImageFetchError
    public enum ImageFetchError {
        case noImage
        case badURL
    }
    
    // MARK: - Public properties
    var imagePlaceholder: UIImage?
    
    // MARK: - Private properties
    private var placeholderView: UIImageView = {
        $0.image = .placeholderForImage
        return $0
    }(UIImageView())
    
    private var session: URLSession
    private var task: URLSessionDataTask?
    private var cacheService: CacheService
    
    // MARK: - Init
    @available (*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    init(imagePlaceholder: UIImage? = nil, session: URLSession = URLSession.shared, cacheService: CacheService = CacheServiceImpl.shared) {
        self.imagePlaceholder = imagePlaceholder
        self.session = session
        self.cacheService = cacheService
        super.init(frame: .zero)
        setupView()
    }
    
    // MARK: - Public methods
    func fetchImage(from imageURL: String, errorHandler: ((ImageFetchError?) -> ())? = nil) {
        showPlaceholder()
        
        guard let url = URL(string: imageURL) else {
            showPlaceholder(withError: true)
            errorHandler?(.badURL)
            return
        }
        
        if let cachedData = cacheService.getData(url: imageURL) {
            hidePlaceholder()
            self.image = UIImage(data: cachedData)
            return
        }
        
        let handler: (Data?, URLResponse?, Error?) -> Void = { [weak self] data, response, error in
            guard let self = self else { return }
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.showPlaceholder(withError: true)
                }
                return
            }
            
            if let imageFromData = UIImage(data: data) {
                self.cacheService.addData(url: imageURL, data: data)
                DispatchQueue.main.async {
                    self.hidePlaceholder()
                    self.image = imageFromData
                }
            } else {
                DispatchQueue.main.async {
                    self.showPlaceholder(withError: true)
                    errorHandler?(.noImage)
                }
            }
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        task = session.dataTask(with: request, completionHandler: handler)
        self.task?.resume()
    }
}

// MARK: - Private extension
private extension LazyImageView {
    private func showPlaceholder(withError: Bool = false) {
        task?.cancel()
        image = nil
        placeholderView.image = withError ? .placeholderError : .placeholderForImage
        placeholderView.isHidden = false
        backgroundColor = .systemGray5
    }
    
    private func hidePlaceholder() {
        placeholderView.isHidden = true
        backgroundColor = .clear
    }
    
    private func setupView() {
        addViews(placeholderView)
        
        placeholderView.contentMode = .center
        
        NSLayoutConstraint.activate([
            placeholderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            placeholderView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
