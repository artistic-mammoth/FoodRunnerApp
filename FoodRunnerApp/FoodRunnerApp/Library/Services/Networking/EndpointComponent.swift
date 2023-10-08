//
//  EndpointComponent.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

protocol EndpointComponent {
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
}
