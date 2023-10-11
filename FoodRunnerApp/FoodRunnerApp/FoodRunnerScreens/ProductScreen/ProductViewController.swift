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
    
    // MARK: - Private properties
    private var productID: String
    
    // MARK: - Views
    lazy var mainImage: LazyImageView = {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 26
        $0.clipsToBounds = true
        $0.backgroundColor = .whiteMain
        return $0
    }(LazyImageView())
    
    lazy var titleLabel: UILabel = {
        $0.textColor = .blackMain
        $0.numberOfLines = 0
        $0.font = .boldInter(size: 25)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    lazy var descriptionLabel: UILabel = {
        $0.textColor = .blackMain
        $0.numberOfLines = 0
        $0.font = .regularInter(size: 17)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    lazy var priceLabel: UILabel = {
        $0.textColor = .whiteMain
        $0.font = .blackInter(size: 25)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var priceSubstrateView: UIView = {
        $0.backgroundColor = .purpleAccent
        $0.layer.cornerRadius = 9
        $0.clipsToBounds = true
       return $0
    }(UIView())
    
    private lazy var addToCartButton: UIButton = {
        $0.backgroundColor = .purpleAccent
        $0.layer.cornerRadius = 9
        $0.clipsToBounds = true
       return $0
    }(UIButton())
    
    private lazy var addToCartButtonImage: UIImageView = {
       return $0
    }(UIImageView())
    
    private lazy var substrateView: UIView = {
        $0.backgroundColor = .whiteMain
        $0.layer.cornerRadius = 26
        $0.clipsToBounds = true
       return $0
    }(UIView())
    
    // MARK: - Init
    @available (*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    init(id: String) {
        self.productID = id
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded(id: productID)
    }
    
}

// MARK: - ProductViewProtocol
extension ProductViewController: ProductViewProtocol {
    func setupProduct(name: String, description: String, price: Int, images: [String]) {
        titleLabel.text = name
        descriptionLabel.text = description
        priceLabel.text = "\(price) ₽"
        
        // TODO: - refactor get first image url
        guard let firstImageURL: String = images.first else {
            print("Wrong First image \(images)")
            return
        }
        
        mainImage.fetchImage(from: firstImageURL)
    }
}

// MARK: - Private extension
private extension ProductViewController {
    func setupView() {
        view.addViews([mainImage, substrateView])
        substrateView.addViews([titleLabel, descriptionLabel, priceSubstrateView, priceLabel, addToCartButton, addToCartButtonImage])
        
        view.backgroundColor = .purpleSecondary
        addToCartButtonImage.image = .plusImage
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainImage.heightAnchor.constraint(equalToConstant: view.bounds.width - 20),
            
            substrateView.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 10),
            substrateView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            substrateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            substrateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            priceSubstrateView.topAnchor.constraint(equalTo: substrateView.topAnchor, constant: 15),
            priceSubstrateView.trailingAnchor.constraint(equalTo: substrateView.centerXAnchor, constant: -22),
            priceSubstrateView.leadingAnchor.constraint(equalTo: substrateView.leadingAnchor, constant: 22),
            priceSubstrateView.heightAnchor.constraint(equalToConstant: 45),
            
            priceLabel.leadingAnchor.constraint(equalTo: priceSubstrateView.leadingAnchor, constant: 10),
            priceLabel.centerYAnchor.constraint(equalTo: priceSubstrateView.centerYAnchor),
            
            addToCartButton.topAnchor.constraint(equalTo: priceSubstrateView.topAnchor),
            addToCartButton.leadingAnchor.constraint(equalTo: priceSubstrateView.trailingAnchor, constant: 15),
            addToCartButton.heightAnchor.constraint(equalToConstant: 45),
            addToCartButton.widthAnchor.constraint(equalToConstant: 45),
            
            addToCartButtonImage.centerXAnchor.constraint(equalTo: addToCartButton.centerXAnchor),
            addToCartButtonImage.centerYAnchor.constraint(equalTo: addToCartButton.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: priceSubstrateView.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: priceSubstrateView.leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: substrateView.trailingAnchor, constant: -22),
            
        ])
    }
}
