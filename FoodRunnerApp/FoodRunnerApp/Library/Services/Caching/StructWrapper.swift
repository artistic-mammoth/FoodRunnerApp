//
//  StructWrapper.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

class StructWrapper<T>: NSObject {
    let value: T

    init(_ _struct: T) {
        value = _struct
    }
}
