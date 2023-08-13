//
//  CategoryHeaderReusableView.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 12.08.2023.
//

import UIKit

class CategoryHeaderReusableView: UICollectionReusableView {
    // MARK: - Public properties
    static let reuseIdentifier = "CategoryHeaderReusableView"
    
    // MARK: - Views
    private lazy var title: UILabel = {
        $0.textColor = .black
        $0.font = .boldInter(size: 23)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    // MARK: - Init
    @available (*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        title.frame = bounds
    }
    
    // MARK: - Public methods
    func configureWith(label: String) {
        title.text = label
    }
}
