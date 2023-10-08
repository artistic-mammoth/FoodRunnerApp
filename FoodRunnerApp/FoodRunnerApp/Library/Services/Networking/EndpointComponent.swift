//
//  EndpointComponent.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

protocol EndpointComponent {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var port: Int? { get }
    var queryItems: [URLQueryItem]? { get }
    var method: HTTPMethod { get }
}
