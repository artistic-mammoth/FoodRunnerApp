//
//  GalleryModuleBuilder.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 16.08.2023.
//

import UIKit

final class GalleryModuleBuilder {
    static func build(color: UIColor) -> GalleryViewController {
        let interactor = GalleryInteractor()
        let router = GalleryRouter()
        let presenter = GalleryPresenter(router: router, interactor: interactor)
        let viewController = GalleryViewController(color: color)
        interactor.presenter = presenter
        router.viewController = viewController
        presenter.view = viewController
        viewController.presenter = presenter
        
        return viewController
    }
}