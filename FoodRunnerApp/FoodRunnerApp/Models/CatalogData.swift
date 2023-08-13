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
    let type: CatalogSectionType
    let headerTitle: String
    let themeColor: UIColor
    let items: [CatalogItemProtocol]
    
    init(type: CatalogSectionType, headerTitle: String, themeColor: UIColor = .clear, items: [CatalogItemProtocol]) {
        self.type = type
        self.headerTitle = headerTitle
        self.themeColor = themeColor
        self.items = items
    }
}

// MARK: - Catalog items
struct CategoryCatalogItem: CatalogItemProtocol {
    let title: String
    let imageURL: String
}

struct PromoCatalogItem: CatalogItemProtocol {
    let product: ProductData
}

struct BigPromoCatalogItem: CatalogItemProtocol {
    let title: String
    let imageURL: String
}
