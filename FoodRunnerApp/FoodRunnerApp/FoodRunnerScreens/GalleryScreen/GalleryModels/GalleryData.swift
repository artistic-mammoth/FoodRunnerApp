//
//  GalleryData.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 18.08.2023.
//

import Foundation

/// Home catalog submission data
typealias GalleryData = [GallerySection]

struct GallerySection {
    let headerTitle: String
    let items: [GalleryItem]
}

struct GalleryItem {
    var id: String
    let name: String
    let description: String
    let imageURL: String
    let price: Int
    
    init(id: String, name: String, description: String = "", imageURL: String, price: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.imageURL = imageURL
        self.price = price
    }
}
