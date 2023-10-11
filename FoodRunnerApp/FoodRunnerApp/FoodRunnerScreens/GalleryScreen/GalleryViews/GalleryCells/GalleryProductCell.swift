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
    
    // MARK: - Views
    private lazy var titleLabel: UILabel = {
        $0.textColor = .whiteMain
        $0.font = .boldInter(size: 17)
        $0.numberOfLines = 0
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private lazy var descriptionLabel: UILabel = {
        $0.textColor = .whiteMain
        $0.font = .regularInter(size: 13)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private lazy var priceLabel: UILabel = {
        $0.textColor = .whiteMain
        $0.font = .boldInter(size: 20)
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
        $0.layer.masksToBounds = true
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
        
        descriptionLabel.text = description
        titleLabel.text = name
        priceLabel.text = "\(price) ₽ +"
        
        imageView.fetchImage(from: imageURL)
    }
    
    // MARK: - Private methods
    private func setupView() {
        addViews(substrateView, titleLabel, descriptionLabel, priceSubstrateView, priceLabel)
        substrateView.addViews(imageView)
        
        backgroundColor = .purpleSecondary
        layer.cornerRadius = 13
        clipsToBounds = true
        
        
        NSLayoutConstraint.activate([
            substrateView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            substrateView.centerYAnchor.constraint(equalTo: centerYAnchor),
            substrateView.heightAnchor.constraint(equalTo: widthAnchor, constant: -15),
            substrateView.widthAnchor.constraint(equalTo: widthAnchor, constant: -15),
            substrateView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: substrateView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: substrateView.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: substrateView.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: substrateView.widthAnchor),

            titleLabel.topAnchor.constraint(equalTo: substrateView.bottomAnchor, constant: 9),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            priceSubstrateView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            priceSubstrateView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceSubstrateView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            priceSubstrateView.heightAnchor.constraint(equalToConstant: 40),
            
            priceLabel.centerXAnchor.constraint(equalTo: priceSubstrateView.centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: priceSubstrateView.centerYAnchor)
        ])
    }
}
