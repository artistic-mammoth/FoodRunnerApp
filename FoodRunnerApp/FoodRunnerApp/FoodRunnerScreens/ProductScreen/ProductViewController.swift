//
//  ProductViewController.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 16.08.2023.
//

import UIKit

final class ProductViewController: UIViewController {
    // MARK: - Public properties
    var presenter: ProductPresenterProtocol?
    
    init(color: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductViewController: ProductViewProtocol {
    
}
