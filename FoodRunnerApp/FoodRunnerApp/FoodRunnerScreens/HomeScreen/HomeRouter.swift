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
    func openCatalogView(id: String) {
        let vc = GalleryModuleBuilder.build(categoryID: id)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func openProductView(id: String) {
        let vc = ProductModuleBuilder.build(id: id)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
