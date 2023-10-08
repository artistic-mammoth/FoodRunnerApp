//
//  ProductRequest.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

struct ProductRequest: NetworkRequest {
    typealias Response = ProductResponse
    var component: EndpointComponent
    var decoder: NetworkDecoderWrapper<Response> = NetworkDecoderWrapper()
    
    init(id: String) {
        self.component = CatalogEndpoints.productFor(id: id)
    }
}
