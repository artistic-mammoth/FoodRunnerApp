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

// MARK: - ProductInteractorProtocol
extension ProductInteractor: ProductInteractorProtocol {
    func getProductBy(id: String, completion: @escaping ((ProductData) -> Void)) {
        let product = DataService.shared.getProductBy(id: id)
        completion(product)
    }
}
