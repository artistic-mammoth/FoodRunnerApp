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
    func viewDidLoaded(categoryID: CatalogRes) {
        
    }
    
}
