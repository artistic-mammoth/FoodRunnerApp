//
//  BigPromoCell.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 12.08.2023.
//

import UIKit

class BigPromoCell: UICollectionViewCell {
    // MARK: - Public properties
    static let reuseIdentifier = "BigPromoCell"
    
    // MARK: - Views
    private lazy var title: UILabel = {
        $0.textColor = .whiteMain
        $0.font = .boldInter(size: 17)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private lazy var image: LazyImageView = {
        $0.contentMode = .scaleAspectFill
       return $0
    }(LazyImageView())
    
    private lazy var gradientSubstrate: CAGradientLayer = {
        $0.colors = [UIColor.blackMain.cgColor, UIColor.clear.cgColor]
        $0.startPoint = CGPoint(x: 0.5, y: 0)
        $0.endPoint = CGPoint(x: 0.5, y: 0.5)
        $0.opacity = 0.9
       return $0
    }(CAGradientLayer())
    
    // MARK: - Init
    @available (*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // MARK: - Override
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientSubstrate.frame = bounds
    }
    
    // MARK: - Public methods
    func configureWith(label: String, imageURL: String) {
        image.image = nil
        gradientSubstrate.isHidden = true
        
        title.text = label
        
        image.fetchImage(from: imageURL)
        // TODO: - gradientSubstrate activity
        gradientSubstrate.isHidden = false
    }
    
    // MARK: - Private methods
    private func setupView() {
        addViews(image, title)
        layer.insertSublayer(gradientSubstrate, at: 1)
        
        backgroundColor = .clear
        layer.cornerRadius = 13
        clipsToBounds = true
        gradientSubstrate.isHidden = true

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.heightAnchor.constraint(equalTo: heightAnchor),
            image.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
