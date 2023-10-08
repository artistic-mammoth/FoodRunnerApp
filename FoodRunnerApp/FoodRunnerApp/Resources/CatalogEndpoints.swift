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
}

// MARK: - EndpointComponentProtocol
extension CatalogEndpoints: EndpointComponent {
    private var apiPath: String {
        "/raw"
    }
    
    var host: String {
        "www.pastebin.com"
    }
    
    var path: String {
        var endpoint: String = ""
        switch self {
        case .homePageInfo:
            endpoint =  "VbeC9UAj"
        case .productSubcategoryPack(subcategory: let subcategory):
            switch subcategory {
            case .bread:
                endpoint = "5DiAN6eH"
            default:
                endpoint = ""
            }
        }
        return apiPath + "/\(endpoint)"
    }
    
    var method: HTTPMethod {
        switch self {
        case .homePageInfo:
            return .get
        case .productSubcategoryPack(subcategory: _):
            return .get
        }
    }
}
