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
        let myQueue = DispatchQueue(label: "myQueue", qos: .userInteractive)
        
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
        NetworkService.shared.getPromosIDs { firstPromoIds, secondPromoIDs in
            guard let firstPromoIds = firstPromoIds, let secondPromoIDs = secondPromoIDs else { group.leave(); return }
            let localGroup = DispatchGroup()
            myQueue.sync {
                firstPromo = []
                secondPromo = []
            }
            
            for item in firstPromoIds {
                localGroup.enter()
                DataService.shared.getProductBy(id: item) { product in
                    myQueue.sync {
                        firstPromo?.append(product)
                        localGroup.leave()
                    }
                }
            }
            
            for item in secondPromoIDs {
                localGroup.enter()
                DataService.shared.getProductBy(id: item) { product in
                    myQueue.sync {
                        secondPromo?.append(product)
                        localGroup.leave()
                    }
                }
            }
            
            localGroup.notify(queue: .main) {
                group.leave()
            }
        }

        group.notify(queue: .main) {
            completion(bigPromo, firstPromo, secondPromo)
        }
    }
}
