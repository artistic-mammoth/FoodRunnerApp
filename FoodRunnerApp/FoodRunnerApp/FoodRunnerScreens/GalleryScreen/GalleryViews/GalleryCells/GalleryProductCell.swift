//
//  GalleryProductCell.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 18.08.2023.
//

import UIKit

final class GalleryProductCell: UICollectionViewCell {
    // MARK: - Public properties
    static let reuseIdentifier = "GalleryProductCell"
    
    // MARK: - Init
    @available (*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // MARK: - Public methods
    func configureWith() {

    }
    
    // MARK: - Private methods
    private func setupView() {
        
    }
}
