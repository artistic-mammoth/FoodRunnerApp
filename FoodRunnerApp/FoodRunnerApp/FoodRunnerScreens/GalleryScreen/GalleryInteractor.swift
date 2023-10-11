//
//  GalleryInteractor.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 16.08.2023.
//

import Foundation

final class GalleryInteractor {
    // MARK: - Public properties
    weak var presenter: GalleryPresenterProtocol?
    
    // MARK: - Private properties
    private var networkClient: NetworkClient
    private var cacheService: CacheService
    
    // MARK: - Init
    init(presenter: GalleryPresenterProtocol? = nil, networkClient: NetworkClient, cacheService: CacheService) {
        self.presenter = presenter
        self.networkClient = networkClient
        self.cacheService = cacheService
    }
}

// MARK: - GalleryInteractorProtocol
extension GalleryInteractor: GalleryInteractorProtocol {
    func loadGalleryDataFor(category: CatalogRes, completion: @escaping ([ProductData]?) -> Void) {
        networkClient.sendRequest(GalleryInfoRequest(category: category)) { [weak self] result in
            switch result {
            case .success(let data):
                let items = data.productsData.map { item in
                    
                    if let cached = self?.cacheService.getProductData(id: item.id) {
                        return cached
                    }
                    
                    let product = ProductData(id: item.id, name: item.name, ammount: item.ammount, description: item.description, imageURLsSet: item.imageURLsSet, price: item.price)
                    
                    self?.cacheService.addProductData(data: product)
                    
                    return product
                }
                DispatchQueue.main.async {
                    completion(items)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
