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
    
    // MARK: - Init
    @available (*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    init(color: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = color
    }

}

extension GalleryViewController: GalleryViewProtocol {
    
}
