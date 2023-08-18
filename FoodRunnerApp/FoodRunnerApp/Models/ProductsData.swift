//
//  ProductsData.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 13.08.2023.
//

import UIKit

struct ProductData {
    let id: String
    let name: String
    let ammount: String
    let description: String
    let imageURLsSet: [String]
    let price: Int
    
    init(id: String, name: String, ammount: String = "", description: String = "", imageURLsSet: [String], price: Int) {
        self.id = id
        self.name = name
        self.ammount = ammount
        self.description = description
        self.imageURLsSet = imageURLsSet
        self.price = price
    }
}
