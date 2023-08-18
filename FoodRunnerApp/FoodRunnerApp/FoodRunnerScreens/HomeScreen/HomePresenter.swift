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
    func didSelectItem(id: String, type: CatalogSectionType) {
        switch type {
        case .category:
            router.openCatalogView(id: id)
        case .promo:
            router.openProductView(id: id)
        case .bigPromo:
            return
        }
    }
    
    func viewDidLoaded() {
        interactor.loadPromoData(completion: { [weak self] bigPromos, firstPromos, secondPromos in
            guard let self = self else { return }
            let data = self.generateCatalogData(bigPromos: bigPromos, firstPromos: firstPromos, secondPromos: secondPromos)
            self.view?.updateCatalogDataWith(data)
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
            let firstPromoItems: [PromoCatalogItem] = firstPromos.map({ PromoCatalogItem(id: $0.id, name: $0.name, description: $0.ammount, imageURL: $0.imageURLsSet.first ?? "", price: $0.price) })
            firstPromo = CatalogSection(id: "promo-first", type: .promo, headerTitle: "Может быть интересно", items: firstPromoItems)
        }
        
        if let secondPromos = secondPromos {
            let secondPromoItems: [PromoCatalogItem] = secondPromos.map({ PromoCatalogItem(id: $0.id, name: $0.name, description: $0.ammount, imageURL: $0.imageURLsSet.first ?? "", price: $0.price) })
            secondPromo = CatalogSection(id: "promo-second", type: .promo, headerTitle: "Еще больше интересного", items: secondPromoItems)
        }
        
        let allCategories: [CatalogSection?] = [
            bigPromo,
            setupCategorySection(id: "baking"),
            setupCategorySection(id: "dairy"),
            firstPromo,
            setupCategorySection(id: "vegetables-and-fruits"),
            setupCategorySection(id: "meat-and-fish"),
            secondPromo,
            setupCategorySection(id: "sweets-and-snacks"),
        ]
        
        return allCategories.compactMap({ $0 })
    }
    
    func setupCategorySection(id: String) -> CatalogSection? {
        let title = CatalogRes.getCategoryNameBy(id: id)
        guard let title = title else { return nil }

        let color = CatalogRes.getCategoryColorBy(id: id)
        let subcategoryNames = CatalogRes.getSubCategoriesBy(id: id)
        guard let subcategoryNames = subcategoryNames else { return nil }
        var items: [CategoryCatalogItem] = []
        
        for name in subcategoryNames {
            let title = CatalogRes.getCategoryNameBy(id: name)
            // TODO: - Use real url for category
            let imageURL = "bag"
            guard let title = title else { return nil }
            let item = CategoryCatalogItem(id: name, title: title, imageURL: imageURL)
            items.append(item)
        }
        
        let categorySection = CatalogSection(id: id, type: .category, headerTitle: title, themeColor: color, items: items)
        
        return categorySection
    }
}
