//
//  NetworkError.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

public enum NetworkError: Error {
    case noInternetConnection
    case badURL
    case decodeFailure
    case noData
    case timeout
    case unknown
}

