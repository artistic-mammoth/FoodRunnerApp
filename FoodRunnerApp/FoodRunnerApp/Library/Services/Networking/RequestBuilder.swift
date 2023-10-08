//
//  RequestBuilder.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

protocol RequestBuilder: AnyObject {
    func buildRequest(_ request: any NetworkRequest) -> Result<URLRequest, NetworkError>
}
