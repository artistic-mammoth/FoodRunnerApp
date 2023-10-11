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
        $0.textColor = .blackMain
        $0.font = .mediumInter(size: 17)
        $0.numberOfLines = 1
        $0.lineBreakMode = .byTruncatingTail
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private lazy var descriptionLabel: UILabel = {
        $0.textColor = .blackMain
        $0.font = .regularInter(size: 13)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private lazy var priceLabel: UILabel = {
        $0.textColor = .whiteMain
        $0.font = .boldInter(size: 17)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private lazy var priceSubstrateView: UIView = {
        $0.backgroundColor = .purpleAccent
        $0.layer.cornerRadius = 9
        $0.clipsToBounds = true
       return $0
    }(UIView())
    
    private lazy var imageView: LazyImageView = {
        $0.contentMode = .scaleAspectFill
        $0.tintColor = .gray
       return $0
    }(LazyImageView())
    
    private lazy var substrateView: UIView = {
        $0.backgroundColor = .whiteMain
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
    func configureWith(name: String, description: String, price: Int, imageURL: String) {
        imageView.image = nil
        substrateView.isHidden = true
        
        descriptionLabel.text = description
        nameLabel.text = name
        priceLabel.text = "\(price) ₽ +"
        
        imageView.fetchImage(from: imageURL)
        substrateView.isHidden = false
    }

    // MARK: - Private methods
    private func setupView() {
        addViews([substrateView, nameLabel, descriptionLabel, priceSubstrateView, priceLabel])
        substrateView.addViews(imageView)
        
        backgroundColor = .clear
        layer.cornerRadius = 13
        clipsToBounds = true
        
        layer.borderColor = UIColor.purpleSecondary.cgColor
        layer.borderWidth = 2

        NSLayoutConstraint.activate([
            substrateView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 9),
            substrateView.centerYAnchor.constraint(equalTo: centerYAnchor),
            substrateView.heightAnchor.constraint(equalTo: heightAnchor, constant: -12),
            substrateView.widthAnchor.constraint(equalTo: heightAnchor, constant: -12),
            
            imageView.centerXAnchor.constraint(equalTo: substrateView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: substrateView.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: substrateView.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: substrateView.widthAnchor),

            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            nameLabel.leadingAnchor.constraint(equalTo: substrateView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            priceSubstrateView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            priceSubstrateView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceSubstrateView.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 10),
            priceSubstrateView.heightAnchor.constraint(equalToConstant: 30),
            
            priceLabel.leadingAnchor.constraint(equalTo: priceSubstrateView.leadingAnchor, constant: 10),
            priceLabel.centerYAnchor.constraint(equalTo: priceSubstrateView.centerYAnchor)
        ])
    }

}
