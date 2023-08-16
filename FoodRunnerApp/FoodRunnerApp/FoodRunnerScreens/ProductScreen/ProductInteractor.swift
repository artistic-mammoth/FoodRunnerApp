//
//  ProductInteractor.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 16.08.2023.
//

import Foundation

final class ProductInteractor {
    // MARK: - Public properties
    weak var presenter: ProductPresenterProtocol?
}

extension ProductInteractor: ProductInteractorProtocol {
    
}
