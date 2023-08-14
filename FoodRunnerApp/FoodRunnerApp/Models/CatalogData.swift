//
//  CatalogData.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 12.08.2023.
//

import UIKit

/// Home catalog submission data
typealias CatalogData = [CatalogSection]

enum CatalogSectionType {
    case category
    case promo
    case bigPromo
}

protocol CatalogItemProtocol { }

// MARK: - Catalog section
struct CatalogSection {
    let id: String
    let type: CatalogSectionType
    let headerTitle: String
    let themeColor: UIColor
    let items: [CatalogItemProtocol]
    
    init(id: String, type: CatalogSectionType, headerTitle: String = "", themeColor: UIColor = .clear, items: [CatalogItemProtocol]) {
        self.id = id
        self.type = type
        self.headerTitle = headerTitle
        self.themeColor = themeColor
        self.items = items
    }
}

// MARK: - Catalog items
struct CategoryCatalogItem: CatalogItemProtocol {
    let id: String
    let title: String
    let imageURL: String
    let isAvailable: Bool
    
    init(id: String, title: String, imageURL: String, isAvailable: Bool = true) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.isAvailable = isAvailable
    }
}

struct PromoCatalogItem: CatalogItemProtocol {
    let product: ProductData
}

struct BigPromoCatalogItem: CatalogItemProtocol {
    let title: String
    let imageURL: String
}
