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
    func getBigPromos(completion: @escaping (([BigPromoCatalogItem]?) -> Void)) {
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now()+0.1) {
            let data = [BigPromoCatalogItem(title: "Очень необходимая подборка", imageURL: "bigPromo_1"),
                        BigPromoCatalogItem(title: "Сладенькое на десерт", imageURL: "bigPromo_2"),
                        BigPromoCatalogItem(title: "Шикарный завтрак", imageURL: "bigPromo_3"),
                        BigPromoCatalogItem(title: "Очень необходимая подборка", imageURL: "bigPromo_1"),
                        BigPromoCatalogItem(title: "Сладенькое на десерт", imageURL: "bigPromo_2"),
                        BigPromoCatalogItem(title: "Шикарный завтрак", imageURL: "bigPromo_3")]
            completion(data)
        }
    }
    
    func getFirstPromos(completion: @escaping (([PromoCatalogItem]?) -> Void)) {
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now()+0.1) {
            let data = [PromoCatalogItem(product: ProductData(
                name: "Молоко Суперское",
                description: "900 мл",
                imageURLsSet: ["promo_1", "face.smiling"],
                price: 79)),
                        PromoCatalogItem(product: ProductData(
                            name: "Коровки няшные",
                            description: "5 шт",
                            imageURLsSet: ["promo_1"],
                            price: 110)),
                        PromoCatalogItem(product: ProductData(
                            name: "Альтернативное молоко с тем же лого",
                            description: "750 мл",
                            imageURLsSet: ["promo_1"],
                            price: 340)),
                        PromoCatalogItem(product: ProductData(
                            name: "Куча конфет без фото",
                            description: "куча",
                            imageURLsSet: [],
                            price: 200))]
            completion(data)
        }
    }
    
    func getSecondPromos(completion: @escaping (([PromoCatalogItem]?) -> Void)) {
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now()+0.1) {
            let data = [PromoCatalogItem(product: ProductData(
                name: "Куча конфет без фото",
                description: "куча",
                imageURLsSet: [],
                price: 200)),
                        PromoCatalogItem(product: ProductData(
                            name: "Альтернативное молоко с тем же лого",
                            description: "750 мл",
                            imageURLsSet: ["promo_1"],
                            price: 340)),
                        PromoCatalogItem(product: ProductData(
                            name: "Коровки няшные",
                            description: "5 шт",
                            imageURLsSet: ["promo_1"],
                            price: 110)),
                        PromoCatalogItem(product: ProductData(
                            name: "Молоко Суперское",
                            description: "900 мл",
                            imageURLsSet: ["promo_1", "face.smiling"],
                            price: 79))]
            completion(data)
        }
    }
    
}
