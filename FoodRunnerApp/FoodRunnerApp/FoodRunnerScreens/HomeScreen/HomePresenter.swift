//
//  HomePresenter.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 14.08.2023.
//

import UIKit

final class HomePresenter {
    // MARK: - Public properties
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol
    var interactor: HomeInteractorProtocol
    
    // MARK: - Init
    init(router: HomeRouterProtocol, interactor: HomeInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

// MARK: - HomePresenterProtocol
extension HomePresenter: HomePresenterProtocol {
    func didSelectItem(_ data: CatalogSectionType) {
        router.openCatalogView(data)
    }
    
    func catalogDataDidLoaded(data: CatalogData) {
        view?.updateCatalogDataWith(data)
    }
    
    func viewDidLoaded() {
        interactor.loadCatalogData()
    }
}
