//
//  ProductViewController.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 16.08.2023.
//

import UIKit

final class ProductViewController: UIViewController {
    // MARK: - Public properties
    var presenter: ProductPresenterProtocol?
    
    // MARK: - Private properties
    private var productID: String
    
    // MARK: - Views
    lazy var mainImage: LazyImageView = {
        $0.contentMode = .scaleAspectFill
        return $0
    }(LazyImageView())
    
    lazy var titleLabel: UILabel = {
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.font = .boldInter(size: 20)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    lazy var descriptionLabel: UILabel = {
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.font = .boldInter(size: 20)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    lazy var priceLabel: UILabel = {
        $0.textColor = .black
        $0.font = .boldInter(size: 27)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var substrateView: UIView = {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 13
        $0.clipsToBounds = true
       return $0
    }(UIView())
    
    // MARK: - Init
    @available (*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    init(id: String) {
        self.productID = id
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded(id: productID)
    }
    
}

// MARK: - ProductViewProtocol
extension ProductViewController: ProductViewProtocol {
    func setupProduct(name: String, description: String, price: Int, images: [String]) {
        titleLabel.text = name
        descriptionLabel.text = description
        priceLabel.text = "\(price) ₽"
        
        // TODO: - refactor get first image url
        guard let firstImageURL: String = images.first else {
            print("Wrong First image \(images)")
            return
        }
        
        mainImage.fetchImage(from: firstImageURL)
    }
}

// MARK: - Private extension
private extension ProductViewController {
    func setupView() {
        view.addViews([mainImage, substrateView])
        substrateView.addViews([titleLabel, descriptionLabel, priceLabel])
        
        view.backgroundColor = .systemGray5
        
        mainImage.layer.cornerRadius = 17
        mainImage.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainImage.heightAnchor.constraint(equalToConstant: view.bounds.width - 20),
            
            substrateView.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 10),
            substrateView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            substrateView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            substrateView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: substrateView.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: substrateView.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.centerXAnchor.constraint(equalTo: substrateView.centerXAnchor),
            
            priceLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            priceLabel.centerXAnchor.constraint(equalTo: substrateView.centerXAnchor)
        ])
    }
}
