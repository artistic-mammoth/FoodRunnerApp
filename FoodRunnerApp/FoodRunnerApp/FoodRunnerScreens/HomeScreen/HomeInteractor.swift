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
    func loadPromoData(completion: @escaping ([BigPromoData]?, [ProductData]?, [ProductData]?) -> Void) {
        let group = DispatchGroup()
        
        var bigPromo: [BigPromoData]?
        var firstPromo: [ProductData]?
        var secondPromo: [ProductData]?
        
        group.enter()
        NetworkService.shared.getBigPromos { data in
            if let data = data {
                bigPromo = data
            }
            group.leave()
        }
        
        group.enter()
        NetworkService.shared.getFirstPromos { data in
            if let data = data {
                firstPromo = data
            }
            group.leave()
        }
        
        group.enter()
        NetworkService.shared.getSecondPromos { data in
            if let data = data {
                secondPromo = data
            }
            group.leave()
        }
        
        group.notify(queue: .main) {
            completion(bigPromo, firstPromo, secondPromo)
        }
    }
}
