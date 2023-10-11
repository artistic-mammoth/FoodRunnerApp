//
//  GalleryScreenProtocols.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 16.08.2023.
//

protocol GalleryViewProtocol: AnyObject {
    func updateGalleryDataWith(_ data: GalleryData)
}

protocol GalleryPresenterProtocol: AnyObject {
    func viewDidLoaded(categoryID: CatalogRes)
    func didSelectItem(id: String)
}

protocol GalleryInteractorProtocol: AnyObject {
    func loadGalleryDataFor(category: CatalogRes, completion: @escaping ([ProductData]?) -> Void)
}

protocol GalleryRouterProtocol: AnyObject {
    func openProductView(id: String)
}
