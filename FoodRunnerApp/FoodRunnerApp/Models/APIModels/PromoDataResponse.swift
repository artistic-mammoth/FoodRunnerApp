//
//  PromoDataResponse.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 17.08.2023.
//

import Foundation

// MARK: - PromoDataResponse
struct PromoDataResponse: Codable {
    let firstPromosIDs, secondPromosIDs: [String]
}
