//
//  BigPromoDataResponse.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 15.08.2023.
//

import Foundation

// MARK: - BigPromoDataResponse
struct BigPromoDataResponse: Codable {
    let bigPromoData: [BigPromoDatum]

    enum CodingKeys: String, CodingKey {
        case bigPromoData = "BigPromoData"
    }
}

// MARK: - BigPromoDatum
struct BigPromoDatum: Codable {
    let id, title: String
    let imageURL: String
}
