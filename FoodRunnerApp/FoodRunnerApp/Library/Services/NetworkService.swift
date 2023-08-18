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
        guard let url = URL(string: APIURLs.bigPromos, relativeTo: URL(string: APIURLs.mainURL)) else { completion(nil); return }

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
    
    func fetchImage(from urlString: String, completion: @escaping (_ imageData: Data?) -> ()) {
        guard let url = URL(string: urlString) else { completion(nil); return }
        
        if let cachedData = CacheService.shared.getData(url: urlString) {
            completion(cachedData)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completion(nil)
                return
            }

            CacheService.shared.addData(url: urlString, data: data)
            completion(data)
        }

        dataTask.resume()
    }
    
    func getPromosIDs(completion: @escaping (([String]?, [String]?) -> Void)) {
        guard let url = URL(string: APIURLs.promos, relativeTo: URL(string: APIURLs.mainURL)) else { completion(nil, nil); return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completion(nil, nil)
                return
            }
            
            if let dataJSON = try? JSONDecoder().decode(PromoDataResponse.self, from: data) {
                let firstPromos = dataJSON.firstPromosIDs
                let secondPromos = dataJSON.secondPromosIDs
                completion(firstPromos, secondPromos)
            }
        }
        
        task.resume()
    }
    
    func loadProductBy(id: String, tag: String = "", completion: @escaping ((ProductData?) -> Void)) {
        
        if let cachedProduct = CacheService.shared.getProductData(id: id) {
            completion(cachedProduct)
        }
        
        // TODO: - actually request API for only one product data!
        loadProducts { isDone in
            guard isDone else { completion(nil); return }
            
            if let cachedProduct = CacheService.shared.getProductData(id: id) {
                completion(cachedProduct)
            } else {
                completion(nil)
            }
        }
    }
    
}

// MARK: - Private extension
private extension NetworkService {
    func loadProducts(for tag: String = "", completion: @escaping ((Bool) -> Void)) {
        guard let url = URL(string: APIURLs.productsTagFirstPack, relativeTo: URL(string: APIURLs.mainURL)) else { completion(false); return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completion(false)
                return
            }
            
            if let dataJSON = try? JSONDecoder().decode(ProductDataResponse.self, from: data) {
                let products = dataJSON.productData.map({ ProductData(id: $0.id, name: $0.name, ammount: $0.ammount, description: $0.description, imageURLsSet: $0.imageURLsSet, price: $0.price) })
                
                products.forEach { DataService.shared.addProduct($0) }

                completion(true)
            }
        }
        
        task.resume()
    }
}
