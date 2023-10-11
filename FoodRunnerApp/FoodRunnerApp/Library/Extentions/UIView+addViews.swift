//
//  UIView+addViews.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 13.08.2023.
//

import UIKit

extension UIView {
    /**
     Additing view to subviews with configuration for AutoLayout.
     - Parameters:
        - views: views to add
     */
    func addViews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
