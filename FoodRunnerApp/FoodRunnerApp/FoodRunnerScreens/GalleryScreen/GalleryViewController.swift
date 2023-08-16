//
//  GalleryViewController.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 14.08.2023.
//

import UIKit

final class GalleryViewController: UIViewController {
    // MARK: - Public properties
    var presenter: GalleryPresenterProtocol?
    
    init(color: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GalleryViewController: GalleryViewProtocol {
    
}
