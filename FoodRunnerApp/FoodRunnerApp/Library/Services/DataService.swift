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
    
    // TODO: - USE CACHE
//    private(set) var bigPromos: [String: BigPromoData] = [:]
    
    // MARK: - Public methods
    func addProduct(_ data: ProductData) {
        CacheService.shared.addProductData(data: data)
    }
    
    func getProductBy(id: String) -> ProductData {
        if let cachedData = CacheService.shared.getProductData(id: id) {
            return cachedData
        } else {
            return ProductData(id: "NONE", name: "NONE", imageURLsSet: [], price: 0)
        }
    }
    
//    func addBigPromo(_ data: BigPromoData) {
//        DispatchQueue.main.async { [weak self] in
//            let id = data.id
//            if self?.bigPromos[id] == nil {
//                self?.bigPromos[id] = data
//            }
//        }
//    }
//
//    func getBigPromoBy(id: String) -> BigPromoData {
//        if let data = bigPromos[id] {
//            return data
//        } else {
//            return BigPromoData(id: "", title: "", imageURL: "")
//        }
//    }
    
}
