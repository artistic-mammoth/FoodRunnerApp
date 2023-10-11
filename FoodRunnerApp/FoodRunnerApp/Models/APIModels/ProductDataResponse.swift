//
//  ProductDataResponse.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 17.08.2023.
//

import Foundation

// MARK: - ProductDataResponse
struct ProductDataResponse: Codable {
    let productsData: [ProductDatum]
}

// MARK: - ProductDatum
struct ProductDatum: Codable {
    let id, name, ammount, description: String
    let imageURLsSet: [String]
    let price: Int
}
