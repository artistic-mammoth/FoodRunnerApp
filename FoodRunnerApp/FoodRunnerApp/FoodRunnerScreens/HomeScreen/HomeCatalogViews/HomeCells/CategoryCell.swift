//
//  CategoryCell.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 12.08.2023.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    // MARK: - Public properties
    static let reuseIdentifier = "CategoryCell"
    
    // MARK: - Views
    private lazy var titleLabel: UILabel = {
        $0.textColor = .whiteMain
        $0.font = .boldInter(size: 17)
        $0.numberOfLines = 0
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private lazy var imageView = UIImageView()
    
    private lazy var gradientSubstrate: CAGradientLayer = {
        $0.colors = [UIColor.purpleAccent.cgColor, UIColor.clear.cgColor]
        $0.startPoint = CGPoint(x: 0.4, y: 0)
        $0.endPoint = CGPoint(x: 0.6, y: 0.9)
        $0.opacity = 0.2
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
    func configureWith(label: String, color: UIColor, imageURL: String) {
        titleLabel.text = label
        imageView.image = UIImage(named: imageURL)
//        backgroundColor = color
        backgroundColor = .purpleSecondary
    }
    
    // MARK: - Private methods
    private func setupView() {
        addViews([imageView, titleLabel])
        
        layer.insertSublayer(gradientSubstrate, at: 0)
        
        backgroundColor = .black
        layer.cornerRadius = 13
        clipsToBounds = true
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 45),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 124),
            imageView.widthAnchor.constraint(equalToConstant: 124)
        ])
    }
    
}
