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
        switch data {
        case .category:
            let vc = GalleryModuleBuilder.build(color: .blue)
            viewController?.navigationController?.pushViewController(vc, animated: true)
            return
        case .promo:
            let vc = ProductModuleBuilder.build(color: .purple)
            viewController?.navigationController?.pushViewController(vc, animated: true)
            return
        case .bigPromo:
            let vc = UIViewController()
            viewController?.navigationController?.pushViewController(vc, animated: true)
            return
        }
    }
}
