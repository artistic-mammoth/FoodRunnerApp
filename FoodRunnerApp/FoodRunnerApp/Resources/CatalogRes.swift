//
//  NamesRes.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 17.08.2023.
//

import Foundation
import UIKit

enum CatalogRes: String {
    case baking = "baking"
    case bread = "bread"
    case pastry
    case breads
    
    case dairy
    case milk
    case cheese
    case yogurts
    case butter
    case eggs
    
    case vegetables_and_fruits
    case vegetables_and_greens
    case fruits_and_berries
    
    case meat_and_fish
    case meat
    case fish
    case sausages
    
    case sweets_and_snacks
    case waffles_and_cookies
    case dried_fruits_and_nuts
    case chocolate_and_candy
    case chips_and_snacks
    
    case bigPromo = "big-promo"
    case promo_1 = "promo-1"
    case promo_2 = "promo-2"
    
    
    func getCategoryName() -> String {
        switch self {
        case .baking:
            return "Выпечка"
        case .bread:
            return "Хлеб"
        case .pastry:
            return "Выпечка"
        case .breads:
            return "Хлебцы"
            
        case .dairy:
            return "Молочное"
        case .milk:
            return "Молоко"
        case .cheese:
            return "Сыр"
        case .yogurts:
            return "Йогурты"
        case .butter:
            return "Масло"
        case .eggs:
            return "Яйца"
            
        case .vegetables_and_fruits:
            return "Овощи и фрукты"
        case .vegetables_and_greens:
            return "Овощи и зелень"
        case .fruits_and_berries:
            return "Фрукты и ягоды"
            
        case .meat_and_fish:
            return "Мясо и рыба"
        case .meat:
            return "Мясо"
        case .fish:
            return "Рыба"
        case .sausages:
            return "Колбаса и сосиски"
            
        case .sweets_and_snacks:
            return "Сладкое и снеки"
        case .waffles_and_cookies:
            return "Вафли и печенье"
        case .dried_fruits_and_nuts:
            return "Сухофрукты и орехи"
        case .chocolate_and_candy:
            return "Шоколад и конфеты"
        case .chips_and_snacks:
            return "Чипсы и снэки"
        case .bigPromo:
            return ""
        case .promo_1:
            return "Может быть интересно"
        case .promo_2:
            return "Еще больше интересного"
        }
    }
    
    func getCategoryColor() -> UIColor {
        switch self {
        case .baking:
            return UIColor(hexString: "F4A261")
        case .dairy:
            return UIColor(hexString: "BDE0FE")
        case .vegetables_and_fruits:
            return UIColor(hexString: "adc178")
        case .meat_and_fish:
            return UIColor(hexString: "f08080")
        case .sweets_and_snacks:
            return UIColor(hexString: "ffecd1")
        default:
            return .gray
        }
    }
    
    func getSubCategories() -> [CatalogRes]? {
        switch self {
        case .baking:
            return [.bread, .pastry, .breads]
        case .dairy:
            return [.milk, .cheese, .yogurts, .butter, .eggs]
        case .vegetables_and_fruits:
            return [.vegetables_and_greens, .fruits_and_berries]
        case .meat_and_fish:
            return [.meat, .fish, .sausages]
        case .sweets_and_snacks:
            return [.waffles_and_cookies, .dried_fruits_and_nuts, .chocolate_and_candy, .chips_and_snacks]
        default:
            return nil
        }
    }
}
