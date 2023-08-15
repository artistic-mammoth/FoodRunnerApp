//
//  HomePresenter.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 14.08.2023.
//

import UIKit

final class HomePresenter {
    // MARK: - Public properties
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol
    var interactor: HomeInteractorProtocol
    
    // MARK: - Init
    init(router: HomeRouterProtocol, interactor: HomeInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

// MARK: - HomePresenterProtocol
extension HomePresenter: HomePresenterProtocol {
    func didSelectItem(_ data: CatalogSectionType) {
        router.openCatalogView(data)
    }

    func viewDidLoaded() {
        interactor.loadPromoData(completion: { [weak self] bigPromos, firstPromos, secondPromos in
            guard let self = self else { return }
            DispatchQueue.main.async {
                let data = self.generateCatalogData(bigPromos: bigPromos, firstPromos: firstPromos, secondPromos: secondPromos)
                self.view?.updateCatalogDataWith(data)
            }
        })
    }
}

private extension HomePresenter {
    func generateCatalogData(bigPromos: [BigPromoData]?, firstPromos: [ProductData]?, secondPromos: [ProductData]?) -> CatalogData {
        
        var bigPromo: CatalogSection?
        var firstPromo: CatalogSection?
        var secondPromo: CatalogSection?
        
        if let bigPromos = bigPromos {
            let bigPromoItems: [BigPromoCatalogItem] = bigPromos.map({ BigPromoCatalogItem(id: $0.id, title: $0.title, imageURL: $0.imageURL)} )
            bigPromo = CatalogSection(id: "big-promo", type: .bigPromo, items: bigPromoItems)
        }
        
        if let firstPromos = firstPromos {
            let firstPromoItems: [PromoCatalogItem] = firstPromos.map({ PromoCatalogItem(id: $0.id, name: $0.name, description: $0.description, imageURL: $0.imageURLsSet.first ?? "", price: $0.price) })
            firstPromo = CatalogSection(id: "promo-first", type: .promo, headerTitle: "Может быть интересно", items: firstPromoItems)
        }
        
        if let secondPromos = secondPromos {
            let secondPromoItems: [PromoCatalogItem] = secondPromos.map({ PromoCatalogItem(id: $0.id, name: $0.name, description: $0.description, imageURL: $0.imageURLsSet.first ?? "", price: $0.price) })
            secondPromo = CatalogSection(id: "promo-second", type: .promo, headerTitle: "Еще больше интересного", items: secondPromoItems)
        }
        
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
        
        return allCategories.compactMap({ $0 })
    }
}
