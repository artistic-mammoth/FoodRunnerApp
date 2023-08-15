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
    let id: String
    let name: String
    let description: String
    let imageURLsSet: ProductImageURLsSet
    let price: Int
    
    init(id: String, name: String, description: String = "", imageURLsSet: ProductImageURLsSet, price: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.imageURLsSet = imageURLsSet
        self.price = price
    }
}

struct BigPromoData {
    let id: String
    let title: String
    let imageURL: String
    let showcase: [String]
    
    init(id: String, title: String, imageURL: String, showcase: [String] = []) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.showcase = showcase
    }
}
