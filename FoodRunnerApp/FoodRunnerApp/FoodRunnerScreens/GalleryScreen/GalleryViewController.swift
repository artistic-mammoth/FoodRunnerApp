//
//  GalleryViewController.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 14.08.2023.
//

import UIKit

final class GalleryViewController: UIViewController {
    // MARK: - Public properties
    var presenter: GalleryPresenterProtocol?
    
    // MARK: - Private properties
    private var categoryID: CatalogRes
    
    // MARK: - Views
    lazy var titleLabel: UILabel = {
        $0.textColor = .blackMain
        $0.numberOfLines = 0
        $0.font = .boldInter(size: 20)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private lazy var loadingLabel: UILabel = {
        $0.text = "Загрузка..."
        $0.textColor = .purpleAccent
        $0.font = .blackInter(size: 20)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var catalogView = GalleryCollectionView()
    
    // MARK: - Init
    @available (*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    init(categoryID: CatalogRes) {
        self.categoryID = categoryID
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded(categoryID: categoryID)
    }

}

extension GalleryViewController: GalleryViewProtocol {
    func updateGalleryDataWith(_ data: GalleryData) {
        loadingLabel.isHidden = true
        catalogView.isHidden = false
        catalogView.galleryData = data
    }
}

extension GalleryViewController: GalleryCollectionViewDelegate {
    func didSelectItem(id: String) {
        presenter?.didSelectItem(id: id)
    }
}

// MARK: - Private extension
private extension GalleryViewController {
    func setupView() {
        view.addViews(loadingLabel, titleLabel, catalogView)
        
        catalogView.delegate = self
        
        view.backgroundColor = .whiteMain
        
        // TODO: - Move to presenter
        titleLabel.text = categoryID.getCategoryName()
        
        NSLayoutConstraint.activate([
            loadingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            catalogView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            catalogView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            catalogView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            catalogView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
}
