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
        guard let url = URL(string: APIURLs.bigPromos, relativeTo: URL(string: APIURLs.mainURL)) else { print("Bad URL"); return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completion(nil)
                return
            }
            
            if let dataJSON = try? JSONDecoder().decode(BigPromoDataResponse.self, from: data) {
                let dataB = dataJSON.bigPromoData.map({BigPromoData(id: $0.id, title: $0.title, imageURL: $0.imageURL) })
                // TODO: - Check for DataB
//                dataB.forEach { DataService.shared.addBigPromo($0) }
                
                completion(dataB)
            }
        }
        
        task.resume()
    }
    
    func fetchImage(from url: String, completion: @escaping (_ imageData: Data?) -> ()) {
        guard let url = URL(string: url) else { return }

        // TODO: - USE CASHE
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completion(nil)
                return
            }

            completion(data)
        }

        dataTask.resume()
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
            
//            products.forEach { DataService.shared.addProduct($0) }
            
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
            
//            products.forEach { DataService.shared.addProduct($0) }
            
            completion(products)
        }
    }
}
