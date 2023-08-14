//
//  HomeScreenProtocols.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 14.08.2023.
//

protocol HomeViewProtocol: AnyObject {
    func updateCatalogDataWith(_ data: CatalogData)
}

protocol HomePresenterProtocol: AnyObject {
    func viewDidLoaded()
    func catalogDataDidLoaded(data: CatalogData)
    func didSelectItem(_ data: CatalogSectionType)
}

protocol HomeInteractorProtocol: AnyObject {
    func loadCatalogData()
}

protocol HomeRouterProtocol: AnyObject {
    func openCatalogView(_ data: CatalogSectionType)
}
