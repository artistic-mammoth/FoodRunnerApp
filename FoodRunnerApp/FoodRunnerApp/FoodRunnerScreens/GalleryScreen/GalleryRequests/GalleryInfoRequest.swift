//
//  GalleryInfoRequest.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 11.10.2023.
//

import Foundation

struct GalleryInfoRequest: NetworkRequest {
    typealias Response = ProductDataResponse
    var component: EndpointComponent
    var decoder: NetworkDecoderWrapper<Response> = NetworkDecoderWrapper()
    
    init(category: CatalogRes) {
        self.component = CatalogEndpoints.productSubcategoryPack(subcategory: category)
    }
}
