//
//  HomeViewController.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 12.08.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Views
    private lazy var catalogView = HomeCatalogView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHandlers()
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

// MARK: - Private extension
private extension HomeViewController {
    func setupView() {
        view.addViews(catalogView)
        
        updateCatalogDataWith(MockData.data)
        
        view.backgroundColor = .white
            
        NSLayoutConstraint.activate([
            catalogView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            catalogView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            catalogView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            catalogView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
    
    func setupHandlers() {
        catalogView.didSelectItem = { [weak self] data in
            guard let self = self else { return }
            
            // TODO: Remove mockup VC
            let vc = MockViewController()
            
            switch data {
            case .category: vc.view.backgroundColor = UIColor(hexString: "adc178")
            case .promo: vc.view.backgroundColor = UIColor(hexString: "bbd0ff")
            case .bigPromo: vc.view.backgroundColor = UIColor(hexString: "40798c")
            }
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func updateCatalogDataWith(_ data: CatalogData) {
        catalogView.catalogData = data
    }
}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct HomePreview: PreviewProvider {
    
    static var previews: some View {
        HomeViewController().toPreview()
    }
}
#endif
