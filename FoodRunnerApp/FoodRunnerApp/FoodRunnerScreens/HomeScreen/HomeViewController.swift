//
//  HomeViewController.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 12.08.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Public properties
    var presenter: HomePresenterProtocol?
    
    // MARK: - Views
    private lazy var catalogView = HomeCatalogView()
    
    private lazy var loadingLabel: UILabel = {
        $0.text = "Загрузка..."
        $0.textColor = .purpleAccent
        $0.font = .blackInter(size: 20)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - HomeViewProtocol
extension HomeViewController: HomeViewProtocol {
    func updateCatalogDataWith(_ data: CatalogData) {
        loadingLabel.isHidden = true
        catalogView.isHidden = false
        catalogView.catalogData = data
    }
}

// MARK: - HomeCatalogViewDelegate
extension HomeViewController: HomeCatalogViewDelegate {
    func didSelectItem(id: String, type: CatalogSectionType) {
        presenter?.didSelectItem(id: id, type: type)
    }
}

// MARK: - Private extension
private extension HomeViewController {
    func setupView() {
        view.addViews(loadingLabel, catalogView)
        
        catalogView.delegate = self
                
        view.backgroundColor = .whiteMain
        
        catalogView.isHidden = true
        
        NSLayoutConstraint.activate([
            loadingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            catalogView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            catalogView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            catalogView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            catalogView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
}
