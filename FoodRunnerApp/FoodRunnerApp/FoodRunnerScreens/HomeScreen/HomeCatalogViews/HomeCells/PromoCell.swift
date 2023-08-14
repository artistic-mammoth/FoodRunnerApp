//
//  PromoCell.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 12.08.2023.
//

import UIKit

class PromoCell: UICollectionViewCell {
    // MARK: - Public properties
    static let reuseIdentifier = "PromoCell"
    
    // MARK: - Views
    private lazy var nameLabel: UILabel = {
        $0.textColor = .black
        $0.font = .mediumInter(size: 15)
        $0.numberOfLines = 2
        $0.lineBreakMode = .byTruncatingTail
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private lazy var descriptionLabel: UILabel = {
        $0.textColor = .gray
        $0.font = .regularInter(size: 13)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private lazy var priceLabel: UILabel = {
        $0.textColor = .black
        $0.font = .boldInter(size: 20)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.tintColor = .gray
       return $0
    }(UIImageView())
    
    private lazy var substrateView: UIView = {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 13
        $0.clipsToBounds = true
       return $0
    }(UIView())
    
    // MARK: - Init
    @available (*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // MARK: - Public methods
    func configureWith(product: ProductData) {
        nameLabel.text = product.name
        descriptionLabel.text = product.description
        priceLabel.text = "\(product.price) ₽"
        
        if let imageURL = product.imageURLsSet.first {
            imageView.image = UIImage(named: imageURL)
        } else {
            imageView.image = UIImage(systemName: "cart.circle.fill")
        }
    }

    // MARK: - Private methods
    private func setupView() {
        addViews([substrateView, nameLabel, descriptionLabel, priceLabel])
        substrateView.addViews(imageView)
        
        backgroundColor = UIColor(hexString: "edf2f4")
        layer.cornerRadius = 13
        clipsToBounds = true

        let topPriceConstraint = priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 3)
        topPriceConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            substrateView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            substrateView.centerYAnchor.constraint(equalTo: centerYAnchor),
            substrateView.heightAnchor.constraint(equalTo: heightAnchor, constant: -10),
            substrateView.widthAnchor.constraint(equalTo: heightAnchor, constant: -10),
            
            imageView.centerXAnchor.constraint(equalTo: substrateView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: substrateView.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: substrateView.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: substrateView.widthAnchor),

            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: substrateView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            topPriceConstraint,
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
        ])
    }

}
