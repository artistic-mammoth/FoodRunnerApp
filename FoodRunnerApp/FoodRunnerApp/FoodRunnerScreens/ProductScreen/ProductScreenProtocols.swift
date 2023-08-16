//
//  ProductScreenProtocols.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 16.08.2023.
//

protocol ProductViewProtocol: AnyObject {
    func setupProduct(name: String, description: String, price: Int, images: ProductImageURLsSet)
}

protocol ProductPresenterProtocol: AnyObject {
    func viewDidLoaded(id: String)
}

protocol ProductInteractorProtocol: AnyObject {
    func getProductBy(id: String, completion: @escaping ((ProductData) -> Void))
}

protocol ProductRouterProtocol: AnyObject {
    
}
