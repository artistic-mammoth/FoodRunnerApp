//
//  NetworkDecoder.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

protocol NetworkDecoder<DataModel>: AnyObject where DataModel : Codable {
    associatedtype DataModel
    func decode(from data: Data) -> DataModel?
}
