//
//  ProductModuleBuilder.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 16.08.2023.
//

import UIKit

final class ProductModuleBuilder {
    static func build(id: String) -> ProductViewController {
        let interactor = ProductInteractor(networkClient: NetworkClientImpl(), cacheService: CacheServiceImpl.shared)
        let router = ProductRouter()
        let presenter = ProductPresenter(router: router, interactor: interactor)
        let viewController = ProductViewController(id: id)
        interactor.presenter = presenter
        router.viewController = viewController
        presenter.view = viewController
        viewController.presenter = presenter
        
        return viewController
    }
}
