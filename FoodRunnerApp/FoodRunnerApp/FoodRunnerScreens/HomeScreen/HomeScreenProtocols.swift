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
    func didSelectItem(id: String, type: CatalogSectionType)
}

protocol HomeInteractorProtocol: AnyObject {
    func loadPromoData(completion: @escaping ([BigPromoData]?, [ProductData]?, [ProductData]?) -> Void)
}

protocol HomeRouterProtocol: AnyObject {
    func openCatalogView(id: String)
    func openProductView(id: String)
}
