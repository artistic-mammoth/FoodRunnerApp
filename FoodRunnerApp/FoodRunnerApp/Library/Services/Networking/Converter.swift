//
//  Converter.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

protocol Converter {
    func decode<T>(from data: Data) -> T?  where T: Codable
}
