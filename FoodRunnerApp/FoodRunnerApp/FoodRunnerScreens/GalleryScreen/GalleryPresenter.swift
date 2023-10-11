//
//  GalleryPresenter.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 16.08.2023.
//

import Foundation

final class GalleryPresenter {
    // MARK: - Public properties
    weak var view: GalleryViewProtocol?
    var router: GalleryRouterProtocol
    var interactor: GalleryInteractorProtocol
    
    // MARK: - Init
    init(router: GalleryRouterProtocol, interactor: GalleryInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

// MARK: - GalleryPresenterProtocol
extension GalleryPresenter: GalleryPresenterProtocol {
    func didSelectItem(id: String) {
        router.openProductView(id: id)
    }
    
    func viewDidLoaded(categoryID: CatalogRes) {
        interactor.loadGalleryDataFor(category: categoryID) { [weak self] data in
            guard let self = self, let data = data else { return }
            let galleryData = self.generateGalleryData(products: data)
            self.view?.updateGalleryDataWith(galleryData)
        }
    }
    
}

private extension GalleryPresenter {
    func generateGalleryData(products: [ProductData]) -> GalleryData {
        var data: GalleryData = []
        
        let items = products.map {
            GalleryItem(id: $0.id, name: $0.name, description: $0.description, imageURL: $0.imageURLsSet.first!, price: $0.price)
        }
        let section: GallerySection = GallerySection(headerTitle: "", items: items)
        data.append(section)
        return data
    }
}
