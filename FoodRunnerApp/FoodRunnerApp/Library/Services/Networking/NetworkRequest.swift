//
//  NetworkRequest.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

protocol NetworkRequest where DataModel: Codable {
    associatedtype DataModel
    
    var component: EndpointComponent { get }
    var decoder: NetworkDecoderWrapper<DataModel> { get }
}
