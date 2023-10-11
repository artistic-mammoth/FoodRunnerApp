//
//  ImageRes.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import UIKit

extension UIImage {
    
    static let placeholderForImage: UIImage = {
        guard let icon = UIImage(systemName: "photo.circle.fill")?
            .withTintColor(.systemGray, renderingMode: .alwaysOriginal)
            .applyingSymbolConfiguration(.init(font: .boldInter(size: 30), scale: .large)) else {
            return UIImage()
        }
        return icon
    }()
    
    static let placeholderError: UIImage = {
        guard let icon = UIImage(systemName: "x.circle")?
            .withTintColor(.systemGray, renderingMode: .alwaysOriginal)
            .applyingSymbolConfiguration(.init(font: .boldInter(size: 30), scale: .large)) else {
            return UIImage()
        }
        return icon
    }()
    
    static let plusImage: UIImage = {
        guard let icon = UIImage(systemName: "plus")?
            .withTintColor(.whiteMain, renderingMode: .alwaysOriginal)
            .applyingSymbolConfiguration(.init(font: .boldInter(size: 20), scale: .large)) else {
            return UIImage()
        }
        return icon
    }()
}
