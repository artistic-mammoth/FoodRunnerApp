//
//  NetworkService.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 14.08.2023.
//

import Foundation

final class NetworkService {
    // MARK: - Singleton
    static let shared = NetworkService()
    private init() {}
    
    // MARK: - Public methods
    func getBigPromos(completion: @escaping (([BigPromoData]?) -> Void)) {
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now()+0.1) {
            let bigPromos = [BigPromoData(id: "1", title: "Очень необходимая подборка", imageURL: "bigPromo_1"),
                             BigPromoData(id: "2", title: "Сладенькое на десерт", imageURL: "bigPromo_2"),
                             BigPromoData(id: "3", title: "Шикарный завтрак", imageURL: "bigPromo_3")]
            
            bigPromos.forEach { DataService.shared.addBigPromo($0) }

            completion(bigPromos)
        }
    }
    
    func getFirstPromos(completion: @escaping (([ProductData]?) -> Void)) {
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now()+0.1) {
            let products = [ProductData(
                id: "1",
                name: "Молоко Суперское",
                description: "900 мл",
                imageURLsSet: ["promo_1", "face.smiling"],
                price: 79),
                        ProductData(
                            id: "2",
                            name: "Коровки няшные",
                            description: "5 шт",
                            imageURLsSet: ["promo_1"],
                            price: 110),
                        ProductData(
                            id: "3",
                            name: "Альтернативное молоко с тем же лого",
                            description: "750 мл",
                            imageURLsSet: ["promo_1"],
                            price: 340),
                        ProductData(
                            id: "4",
                            name: "Куча конфет без фото",
                            description: "куча",
                            imageURLsSet: [],
                            price: 200)]
            
            products.forEach { DataService.shared.addProduct($0) }
            
            completion(products)
        }
    }
    
    func getSecondPromos(completion: @escaping (([ProductData]?) -> Void)) {
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now()+0.1) {
            let products = [ProductData(
                id: "1",
                name: "Молоко Суперское",
                description: "900 мл",
                imageURLsSet: ["promo_1", "face.smiling"],
                price: 79),
                        ProductData(
                            id: "2",
                            name: "Коровки няшные",
                            description: "5 шт",
                            imageURLsSet: ["promo_1"],
                            price: 110),
                        ProductData(
                            id: "3",
                            name: "Альтернативное молоко с тем же лого",
                            description: "750 мл",
                            imageURLsSet: ["promo_1"],
                            price: 340),
                        ProductData(
                            id: "4",
                            name: "Куча конфет без фото",
                            description: "куча",
                            imageURLsSet: [],
                            price: 200)]
            
            products.forEach { DataService.shared.addProduct($0) }
            
            completion(products)
        }
    }
}
