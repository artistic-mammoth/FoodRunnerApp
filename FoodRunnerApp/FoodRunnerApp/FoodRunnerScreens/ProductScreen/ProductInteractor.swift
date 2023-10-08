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
    
    // MARK: - Private properties
    private var networkClient: NetworkClient
    private var cacheService: CacheService
    
    // MARK: - Init
    init(presenter: ProductPresenterProtocol? = nil, networkClient: NetworkClient, cacheService: CacheService) {
        self.presenter = presenter
        self.networkClient = networkClient
        self.cacheService = cacheService
    }
}

// MARK: - ProductInteractorProtocol
extension ProductInteractor: ProductInteractorProtocol {
    func getProductBy(id: String, completion: @escaping ((ProductData) -> Void)) {
        networkClient.sendRequest(ProductRequest(id: id)) { [weak self] result in
            switch result {
            case .success(let data):
                if let id = data.id,
                   let name = data.name,
                   let amount = data.ammount,
                   let description = data.description,
                   let imageURLsSet = data.imageURLsSet,
                   let price = data.price {
                    
                    if let cached = self?.cacheService.getProductData(id: id) {
                        completion(cached)
                    }
                    
                    let product = ProductData(id: id, name: name, ammount: amount, description: description, imageURLsSet: imageURLsSet, price: price)
                    
                    self?.cacheService.addProductData(data: product)
                    
                    completion(product)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
