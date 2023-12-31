//
//  GalleryRouter.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 16.08.2023.
//

import Foundation

final class GalleryRouter {
    // MARK: - Public properties
    weak var viewController: GalleryViewController?
}

extension GalleryRouter: GalleryRouterProtocol {
    func openProductView(id: String) {
        let vc = ProductModuleBuilder.build(id: id)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
