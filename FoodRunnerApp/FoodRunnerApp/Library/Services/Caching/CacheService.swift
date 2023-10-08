//
//  CacheService.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

protocol CacheService {
    func addData(url: String, data: Data)
    func getData(url: String) -> Data?
    func addProductData(data: ProductData)
    func getProductData(id: String) -> ProductData?
}
