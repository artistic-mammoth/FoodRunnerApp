//
//  CacheService.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 16.08.2023.
//

import Foundation
import UIKit

final class CacheService {
    // MARK: - Singleton
    static let shared = CacheService()
    private init() {}
    
    private let dataCache: NSCache<NSString, NSData> = {
        let cache = NSCache<NSString, NSData>()
        cache.countLimit = 100
        cache.totalCostLimit = 100 * 1000 * 1000
        return cache
    }()
    
    func addData(url: String, data: Data) {
        dataCache.setObject(data as NSData, forKey: url as NSString)
    }
    
    func getData(url: String) -> Data? {
        let data = dataCache.object(forKey: url as NSString) as? Data
        return data
    }
}
