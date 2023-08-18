//
//  DataService.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 14.08.2023.
//

import Foundation

final class DataService {
    // MARK: - Singleton
    static let shared = DataService()
    private init() {}
    
    // MARK: - Public methods
    func addProduct(_ data: ProductData) {
        CacheService.shared.addProductData(data: data)
    }
    
    func getProductBy(id: String, completion: @escaping ((ProductData) -> Void)) {
        let empty = ProductData(id: "NONE", name: "NONE", imageURLsSet: [], price: 0)
        
        NetworkService.shared.loadProductBy(id: id) { data in
            guard let data = data else { completion(empty); return }
            completion(data)
        }
    }
}
