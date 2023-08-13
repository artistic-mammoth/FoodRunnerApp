//
//  ProductsData.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 13.08.2023.
//

import UIKit

/// Array of image URLs
typealias ProductImageURLsSet = [String]

struct ProductData {
    let name: String
    let description: String
    let imageURLsSet: ProductImageURLsSet
    let price: Int
    
    init(name: String, description: String = "", imageURLsSet: ProductImageURLsSet, price: Int) {
        self.name = name
        self.description = description
        self.imageURLsSet = imageURLsSet
        self.price = price
    }
}
