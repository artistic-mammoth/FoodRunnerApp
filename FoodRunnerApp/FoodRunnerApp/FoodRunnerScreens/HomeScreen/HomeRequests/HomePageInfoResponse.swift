//
//  HomePageInfoResponse.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

// MARK: - HomePageInfoResponse
struct HomePageInfoResponse: Codable {
    let bigPromoData: [BigPromoDatum]?
    let productPromosIDs1, productPromosIDs2: [ProductPromosIDs]?

    enum CodingKeys: String, CodingKey {
        case bigPromoData = "BigPromoData"
        case productPromosIDs1 = "ProductPromosIDs-1"
        case productPromosIDs2 = "ProductPromosIDs-2"
    }
}

// MARK: - BigPromoDatum
struct BigPromoDatum: Codable {
    let id, title: String?
    let imageURL: String?
}

// MARK: - ProductPromosIDs
struct ProductPromosIDs: Codable {
    let id, name, ammount, description: String?
    let imageURLsSet: [String]?
    let price: Int?
}
