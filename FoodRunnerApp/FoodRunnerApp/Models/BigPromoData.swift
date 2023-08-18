//
//  BigPromoData.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 17.08.2023.
//

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
