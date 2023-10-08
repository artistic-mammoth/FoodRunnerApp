//
//  RequestBuilderImpl.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

final class RequestBuilderImpl: RequestBuilder {
    func buildRequest(_ request: any NetworkRequest) -> Result<URLRequest, NetworkError> {
        guard let url = getURLFrom(request) else {
            return .failure(.badURL)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.component.method.rawValue
        urlRequest.timeoutInterval = 10

        return .success(urlRequest)
    }
}

// MARK: - Private extentions
private extension RequestBuilderImpl {
    func getURLFrom(_ request: any NetworkRequest) -> URL? {
        var urlComponents: URLComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = request.component.host
        urlComponents.path = request.component.path
        return urlComponents.url
    }
}
