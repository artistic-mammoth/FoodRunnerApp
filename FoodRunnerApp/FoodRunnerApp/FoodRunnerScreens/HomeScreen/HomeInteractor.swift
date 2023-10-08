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
    
    // MARK: - Private properties
    private var networkClient: NetworkClient
    
    // MARK: - Init
    init(presenter: HomePresenterProtocol? = nil, networkClient: NetworkClient) {
        self.presenter = presenter
        self.networkClient = networkClient
    }
}

// MARK: - HomeInteractorProtocol
extension HomeInteractor: HomeInteractorProtocol {
    func loadPromoData(completion: @escaping ([BigPromoData]?, [ProductData]?, [ProductData]?) -> Void) {
        networkClient.sendRequest(HomePageInfoRequest()) { result in
            switch result {
            case .success(let data):
                let bigPromo = data.bigPromoData?.compactMap { item in
                    if let id = item.id, let title = item.title, let imageURL = item.imageURL {
                        return BigPromoData(id: id, title: title, imageURL: imageURL)
                    }
                    return nil
                }
                // TODO: - Implement caching
                let promo_1 = data.productPromosIDs1?.compactMap { item in
                    if let id = item.id,
                       let name = item.name,
                       let amount = item.ammount,
                       let description = item.description,
                       let imageURLsSet = item.imageURLsSet,
                       let price = item.price {
                        return ProductData(id: id, name: name, ammount: amount, description: description, imageURLsSet: imageURLsSet, price: price)
                    }
                    return nil
                }
                
                let promo_2 = data.productPromosIDs2?.compactMap { item in
                    if let id = item.id,
                       let name = item.name,
                       let amount = item.ammount,
                       let description = item.description,
                       let imageURLsSet = item.imageURLsSet,
                       let price = item.price {
                        return ProductData(id: id, name: name, ammount: amount, description: description, imageURLsSet: imageURLsSet, price: price)
                    }
                    return nil
                }
                DispatchQueue.main.async {
                    completion(bigPromo, promo_1, promo_2)
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    completion(nil, nil, nil)
                }
            }
        }
    }
}
