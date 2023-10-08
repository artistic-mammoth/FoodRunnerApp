//
//  CacheServiceImpl.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 16.08.2023.
//

import Foundation
import UIKit

// TODO: - Refactor it
final class CacheServiceImpl {
    // MARK: - Singleton
    static let shared = CacheServiceImpl()
    private init() {}
    
    private let dataCache: NSCache<NSString, NSData> = {
        let cache = NSCache<NSString, NSData>()
        cache.countLimit = 100
        cache.totalCostLimit = 100 * 1000 * 1000
        return cache
    }()
    
    private let productsCache: NSCache<NSString, StructWrapper<ProductData>> = {
        let cache = NSCache<NSString, StructWrapper<ProductData>>()
        cache.countLimit = 100
        cache.totalCostLimit = 100 * 1000 * 1000
        return cache
    }()

}

extension CacheServiceImpl: CacheService {
    func addData(url: String, data: Data) {
        dataCache.setObject(data as NSData, forKey: url as NSString)
    }
    
    func getData(url: String) -> Data? {
        let data = dataCache.object(forKey: url as NSString) as? Data
        return data
    }
    
    func addProductData(data: ProductData) {
        productsCache.setObject(StructWrapper(data), forKey: data.id as NSString)
    }
    
    func getProductData(id: String) -> ProductData? {
        let data = productsCache.object(forKey: id as NSString)
        return data?.value
    }
}
