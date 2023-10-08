//
//  HomeModuleBuilder.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 14.08.2023.
//

import UIKit

final class HomeModuleBuilder {
    static func build() -> HomeViewController {
        let interactor = HomeInteractor(networkClient: NetworkClientImpl())
        let router = HomeRouter()
        let presenter = HomePresenter(router: router, interactor: interactor)
        let viewController = HomeViewController()
        interactor.presenter = presenter
        router.viewController = viewController
        presenter.view = viewController
        viewController.presenter = presenter
        
        return viewController
    }
}
