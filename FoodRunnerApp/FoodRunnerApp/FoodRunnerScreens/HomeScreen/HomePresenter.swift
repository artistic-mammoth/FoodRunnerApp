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
            if let catalogID = CatalogRes(rawValue: id) {
                router.openCatalogView(id: catalogID)
            }
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
            bigPromo = CatalogSection(id: .bigPromo, type: .bigPromo, items: bigPromoItems)
        }
        
        if let firstPromos = firstPromos {
            let firstPromoItems: [PromoCatalogItem] = firstPromos.map({ PromoCatalogItem(id: $0.id, name: $0.name, description: $0.ammount, imageURL: $0.imageURLsSet.first ?? "", price: $0.price) })
            firstPromo = CatalogSection(id: .promo_1, type: .promo, headerTitle: CatalogRes.promo_1.getCategoryName(), items: firstPromoItems)
        }
        
        if let secondPromos = secondPromos {
            let secondPromoItems: [PromoCatalogItem] = secondPromos.map({ PromoCatalogItem(id: $0.id, name: $0.name, description: $0.ammount, imageURL: $0.imageURLsSet.first ?? "", price: $0.price) })
            secondPromo = CatalogSection(id: .promo_2, type: .promo, headerTitle: CatalogRes.promo_2.getCategoryName(), items: secondPromoItems)
        }
        
        let allCategories: [CatalogSection?] = [
            bigPromo,
            setupCategorySectionFor(.baking),
            setupCategorySectionFor(.dairy),
            firstPromo,
            setupCategorySectionFor(.vegetables_and_fruits),
            setupCategorySectionFor(.meat_and_fish),
            secondPromo,
            setupCategorySectionFor(.sweets_and_snacks),
        ]
        
        return allCategories.compactMap({ $0 })
    }
    
    func setupCategorySectionFor(_ category: CatalogRes) -> CatalogSection? {
        let title = category.getCategoryName()

        let color = category.getCategoryColor()
        let subcategoryNames = category.getSubCategories()
        guard let subcategoryNames = subcategoryNames else { return nil }
        var items: [CategoryCatalogItem] = []
        
        for subcategory in subcategoryNames {
            let title = subcategory.getCategoryName()
            // TODO: - Use real url for category
            let imageURL = "bag"
            let item = CategoryCatalogItem(catalogID: subcategory, title: title, imageURL: imageURL)
            items.append(item)
        }
        
        let categorySection = CatalogSection(id: category, type: .category, headerTitle: title, themeColor: color, items: items)
        
        return categorySection
    }
}
