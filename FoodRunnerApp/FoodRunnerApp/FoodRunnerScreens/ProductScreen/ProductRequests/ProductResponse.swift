//
//  ProductResponse.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

// MARK: - ProductResponse
struct ProductResponse: Codable {
    let id, name, ammount, description: String?
    let imageURLsSet: [String]?
    let price: Int?
}
