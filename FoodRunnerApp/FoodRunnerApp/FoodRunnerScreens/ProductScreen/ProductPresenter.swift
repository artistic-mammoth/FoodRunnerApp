//
//  ProductPresenter.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 16.08.2023.
//

import Foundation

final class ProductPresenter {
    // MARK: - Public properties
    weak var view: ProductViewProtocol?
    var router: ProductRouterProtocol
    var interactor: ProductInteractorProtocol
    
    // MARK: - Init
    init(router: ProductRouterProtocol, interactor: ProductInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension ProductPresenter: ProductPresenterProtocol {
    func viewDidLoaded() {
        
    }
    
}
