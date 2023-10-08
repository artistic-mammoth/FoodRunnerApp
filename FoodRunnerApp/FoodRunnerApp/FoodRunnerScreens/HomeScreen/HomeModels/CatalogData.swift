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

protocol CatalogItemProtocol {
    var id: String { get set }
}

// MARK: - Catalog section
struct CatalogSection {
    let id: CatalogRes
    let type: CatalogSectionType
    let headerTitle: String
    let themeColor: UIColor
    let items: [CatalogItemProtocol]
    
    init(id: CatalogRes, type: CatalogSectionType, headerTitle: String = "", themeColor: UIColor = .clear, items: [CatalogItemProtocol]) {
        self.id = id
        self.type = type
        self.headerTitle = headerTitle
        self.themeColor = themeColor
        self.items = items
    }
}

// MARK: - Catalog items
struct CategoryCatalogItem: CatalogItemProtocol {
    var catalogID: CatalogRes
    var id: String {
        get {
            catalogID.rawValue
        }
        set { }
    }
    let title: String
    let imageURL: String
    let isAvailable: Bool
    
    init(catalogID: CatalogRes, title: String, imageURL: String, isAvailable: Bool = true) {
        self.catalogID = catalogID
        self.title = title
        self.imageURL = imageURL
        self.isAvailable = isAvailable
    }
}

struct PromoCatalogItem: CatalogItemProtocol {
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

struct BigPromoCatalogItem: CatalogItemProtocol {
    var id: String
    let title: String
    let imageURL: String
}
