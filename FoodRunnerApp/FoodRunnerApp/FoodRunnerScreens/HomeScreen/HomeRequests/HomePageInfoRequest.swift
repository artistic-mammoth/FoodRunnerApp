//
//  HomePageInfoRequest.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

struct HomePageInfoRequest: NetworkRequest {
    typealias Response = HomePageInfoResponse
    var component: EndpointComponent = CatalogEndpoints.homePageInfo
    var decoder: NetworkDecoderWrapper<Response> = NetworkDecoderWrapper()
}
