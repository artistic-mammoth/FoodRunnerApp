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
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.font = .boldInter(size: 20)
        $0.textAlignment = .left
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
    
}

// MARK: - Private extension
private extension GalleryViewController {
    func setupView() {
        view.addViews(titleLabel)
        
        view.backgroundColor = .white
        
        // TODO: - Move to presenter
        titleLabel.text = categoryID.getCategoryName()

        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
}
