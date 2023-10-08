//
//  NetworkClient.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

protocol NetworkClient {
    func sendRequest<T: NetworkRequest>(_ request: T, completion: @escaping (Result<T.DataModel, NetworkError>) -> ())
}
