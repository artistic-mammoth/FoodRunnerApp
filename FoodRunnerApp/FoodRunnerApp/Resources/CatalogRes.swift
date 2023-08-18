//
//  NamesRes.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 17.08.2023.
//

import Foundation
import UIKit

enum CatalogRes {
    static func getCategoryNameBy(id: String) -> String? {
        switch id {
        case "baking":
            return "Выпечка"
        case "bread":
            return "Хлеб"
        case "pastry":
            return "Выпечка"
        case "breads":
            return "Хлебцы"
            
        case "dairy":
            return "Молочное"
        case "milk":
            return "Молоко"
        case "cheese":
            return "Сыр"
        case "yogurts":
            return "Йогурты"
        case "butter":
            return "Масло"
        case "eggs":
            return "Яйца"
            
        case "vegetables-and-fruits":
            return "Овощи и фрукты"
        case "vegetables-and-greens":
            return "Овощи и зелень"
        case "fruits-and-berries":
            return "Фрукты и ягоды"
            
        case "meat-and-fish":
            return "Мясо и рыба"
        case "meat":
            return "Мясо"
        case "fish":
            return "Рыба"
        case "sausages":
            return "Колбаса и сосиски"
            
        case "sweets-and-snacks":
            return "Сладкое и снеки"
        case "waffles-and-cookies":
            return "Вафли и печенье"
        case "dried-fruits-and-nuts":
            return "Сухофрукты и орехи"
        case "chocolate-and-candy":
            return "Шоколад и конфеты"
        case "chips-and-snacks":
            return "Чипсы и снэки"
            
        default:
            return nil
        }
    }
    
    static func getCategoryColorBy(id: String) -> UIColor {
        switch id {
        case "baking":
            return UIColor(hexString: "F4A261")
        case "dairy":
            return UIColor(hexString: "BDE0FE")
        case "vegetables-and-fruits":
            return UIColor(hexString: "adc178")
        case "meat-and-fish":
            return UIColor(hexString: "f08080")
        case "sweets-and-snacks":
            return UIColor(hexString: "ffecd1")
        default:
            return .gray
        }
    }
    
    static func getSubCategoriesBy(id: String) -> [String]? {
        switch id {
        case "baking":
            return ["bread", "pastry", "breads"]
        case "dairy":
            return ["milk", "cheese", "yogurts", "butter", "eggs"]
        case "vegetables-and-fruits":
            return ["vegetables-and-greens", "fruits-and-berries"]
        case "meat-and-fish":
            return ["meat", "fish", "sausages"]
        case "sweets-and-snacks":
            return ["waffles-and-cookies", "dried-fruits-and-nuts", "chocolate-and-candy", "chips-and-snacks"]
        default:
            return nil
        }
    }
}
