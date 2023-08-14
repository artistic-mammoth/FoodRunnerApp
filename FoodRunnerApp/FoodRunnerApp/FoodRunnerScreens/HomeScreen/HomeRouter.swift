//
//  HomeRouter.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 14.08.2023.
//

import UIKit

final class HomeRouter {
    // MARK: - Public properties
    weak var viewController: HomeViewController?
}

// MARK: - HomeRouterProtocol
extension HomeRouter: HomeRouterProtocol {
    func openCatalogView(_ data: CatalogSectionType) {
        // TODO: Remove mockup VC
        let vc = MockViewController()
        
        switch data {
        case .category: vc.view.backgroundColor = UIColor(hexString: "adc178")
        case .promo: vc.view.backgroundColor = UIColor(hexString: "bbd0ff")
        case .bigPromo: vc.view.backgroundColor = UIColor(hexString: "40798c")
        }
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
