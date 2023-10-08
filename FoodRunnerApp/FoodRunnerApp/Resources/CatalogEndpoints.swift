//
//  CatalogEndpoints.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

enum CatalogEndpoints {
    case homePageInfo
    case productSubcategoryPack(subcategory: CatalogRes)
    case productFor(id: String)
}

// MARK: - EndpointComponentProtocol
extension CatalogEndpoints: EndpointComponent {
    var scheme: String {
        return "http"
    }
    
    var host: String {
        "127.0.0.1"
    }
    
    var path: String {
        switch self {
        case .homePageInfo:
            return "/home-page-info"
        case .productSubcategoryPack(subcategory: _), .productFor(id: _):
            return "/products"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var port: Int? {
        return 5000
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .homePageInfo:
            return nil
        case .productSubcategoryPack(subcategory: let subcategory):
            return [URLQueryItem(name: "category", value: subcategory.rawValue)]
        case .productFor(id: let id):
            return [URLQueryItem(name: "id", value: id)]
        }
    }
}
