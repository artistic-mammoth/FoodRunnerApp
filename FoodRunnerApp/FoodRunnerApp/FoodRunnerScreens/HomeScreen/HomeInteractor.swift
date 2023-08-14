//
//  HomeInteractor.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 14.08.2023.
//

import Foundation
import UIKit

final class HomeInteractor {
    // MARK: - Public properties
    weak var presenter: HomePresenterProtocol?
}

// MARK: - HomeInteractorProtocol
extension HomeInteractor: HomeInteractorProtocol {
    func loadCatalogData() {
        generateCatalogData { [weak self] data in
            self?.presenter?.catalogDataDidLoaded(data: data)
        }
    }
}

// MARK: - Private extension
private extension HomeInteractor {
    func generateCatalogData(completion: @escaping ((CatalogData) -> Void)) {
        
        let group = DispatchGroup()
        
        var bigPromo: CatalogSection?
        var firstPromo: CatalogSection?
        var secondPromo: CatalogSection?
        
        group.enter()
        NetworkService.shared.getBigPromos { data in
            if let data = data {
                bigPromo = CatalogSection(id: "big-promo", type: .bigPromo, items: data)
            }
            group.leave()
        }
        
        group.enter()
        NetworkService.shared.getFirstPromos { data in
            if let data = data {
                firstPromo = CatalogSection(id: "promo-first", type: .promo, headerTitle: "Может быть интересно", items: data)
            }
            group.leave()
        }
        
        group.enter()
        NetworkService.shared.getSecondPromos { data in
            if let data = data {
                secondPromo = CatalogSection(id: "promo-second", type: .promo, headerTitle: "Еще больше интересного", items: data)
            }
            group.leave()
        }


        group.notify(queue: .main) {
            let allCategories: [CatalogSection?] = [
                bigPromo,
                .init(id: "baking", type: .category, headerTitle: "Выпечка", themeColor: UIColor(hexString: "F4A261"), items: [
                    CategoryCatalogItem(id: "bread", title: "Хлеб", imageURL: "bag"),
                    CategoryCatalogItem(id: "pastry", title: "Выпечка", imageURL: "bag"),
                    CategoryCatalogItem(id: "breads", title: "Хлебцы", imageURL: "bag")
                ]),
                .init(id: "dairy", type: .category, headerTitle: "Молочное", themeColor: UIColor(hexString: "BDE0FE"), items: [
                    CategoryCatalogItem(id: "milk", title: "Молоко", imageURL: "bag"),
                    CategoryCatalogItem(id: "cheese", title: "Сыр", imageURL: "bag"),
                    CategoryCatalogItem(id: "yogurts", title: "Йогурты", imageURL: "bag"),
                    CategoryCatalogItem(id: "butter", title: "Масло", imageURL: "bag"),
                    CategoryCatalogItem(id: "eggs", title: "Яйца", imageURL: "bag")
                ]),
                firstPromo,
                .init(id: "vegetables-and-fruits", type: .category, headerTitle: "Овощи и фрукты", themeColor: UIColor(hexString: "adc178"), items: [
                    CategoryCatalogItem(id: "", title: "Овощи и зелень", imageURL: "bag"),
                    CategoryCatalogItem(id: "", title: "Фрукты и ягоды", imageURL: "bag"),
                ]),
                .init(id: "meat-and-fish", type: .category, headerTitle: "Мясо и рыба", themeColor: UIColor(hexString: "f08080"), items: [
                    CategoryCatalogItem(id: "", title: "Мясо", imageURL: "bag"),
                    CategoryCatalogItem(id: "", title: "Рыба", imageURL: "bag"),
                    CategoryCatalogItem(id: "", title: "Колбаса и сосиски", imageURL: "bag"),
                ]),
                secondPromo,
                .init(id: "sweets-and-snacks", type: .category, headerTitle: "Сладкое и снеки", themeColor: UIColor(hexString: "ffecd1"), items: [
                    CategoryCatalogItem(id: "", title: "Вафли и печенье", imageURL: "bag"),
                    CategoryCatalogItem(id: "", title: "Сухофрукты и орехи", imageURL: "bag"),
                    CategoryCatalogItem(id: "", title: "Шоколад и конфеты", imageURL: "bag"),
                    CategoryCatalogItem(id: "", title: "Чипсы и снэки", imageURL: "bag"),
                ]),
            ]
            completion(allCategories.compactMap({ $0 }))
        }

    }
}
