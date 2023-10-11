//
//  GalleryModuleBuilder.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 16.08.2023.
//

import UIKit

final class GalleryModuleBuilder {
    static func build(categoryID: CatalogRes) -> GalleryViewController {
        let interactor = GalleryInteractor(networkClient: NetworkClientImpl(), cacheService: CacheServiceImpl.shared)
        let router = GalleryRouter()
        let presenter = GalleryPresenter(router: router, interactor: interactor)
        let viewController = GalleryViewController(categoryID: categoryID)
        interactor.presenter = presenter
        router.viewController = viewController
        presenter.view = viewController
        viewController.presenter = presenter
        
        return viewController
    }
}
