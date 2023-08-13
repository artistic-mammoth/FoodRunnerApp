//
//  MockData.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 12.08.2023.
//

import UIKit

struct MockData {

    static var data: CatalogData {
        [
            .init(type: .bigPromo, headerTitle: "!", themeColor: UIColor(hexString: "F4A261"), items: [
                BigPromoCatalogItem(title: "Очень необходимая подборка", imageURL: "bigPromo_1"),
                BigPromoCatalogItem(title: "Сладенькое на десерт", imageURL: "bigPromo_2"),
                BigPromoCatalogItem(title: "Шикарный завтрак", imageURL: "bigPromo_3"),
                BigPromoCatalogItem(title: "Очень необходимая подборка", imageURL: "bigPromo_1"),
                BigPromoCatalogItem(title: "Сладенькое на десерт", imageURL: "bigPromo_2"),
                BigPromoCatalogItem(title: "Шикарный завтрак", imageURL: "bigPromo_3"),
            ]),
            .init(type: .category, headerTitle: "Выпечка", themeColor: UIColor(hexString: "F4A261"), items: [
                CategoryCatalogItem(title: "Хлеб", imageURL: "bag"),
                CategoryCatalogItem(title: "Выпечка", imageURL: "bag"),
                CategoryCatalogItem(title: "Хлебцы", imageURL: "bag")
            ]),
            .init(type: .category, headerTitle: "Молочное", themeColor: UIColor(hexString: "BDE0FE"), items: [
                CategoryCatalogItem(title: "Молоко", imageURL: "bag"),
                CategoryCatalogItem(title: "Сыр", imageURL: "bag"),
                CategoryCatalogItem(title: "Йогурты", imageURL: "bag"),
                CategoryCatalogItem(title: "Масло", imageURL: "bag"),
                CategoryCatalogItem(title: "Яйца", imageURL: "bag")
            ]),
            .init(type: .promo, headerTitle: "Может быть интересно", items: [
                PromoCatalogItem(product: ProductData(
                    name: "Молоко Суперское",
                    description: "900 мл",
                    imageURLsSet: ["promo_1", "face.smiling"],
                    price: 79)),
                PromoCatalogItem(product: ProductData(
                    name: "Коровки няшные",
                    description: "5 шт",
                    imageURLsSet: ["promo_1"],
                    price: 110)),
                PromoCatalogItem(product: ProductData(
                    name: "Альтернативное молоко с тем же лого",
                    description: "750 мл",
                    imageURLsSet: ["promo_1"],
                    price: 340)),
                PromoCatalogItem(product: ProductData(
                    name: "Куча конфет без фото",
                    description: "куча",
                    imageURLsSet: [],
                    price: 200))
            ]),
            .init(type: .category, headerTitle: "Овощи и фрукты", themeColor: UIColor(hexString: "adc178"), items: [
                CategoryCatalogItem(title: "Овощи и зелень", imageURL: "bag"),
                CategoryCatalogItem(title: "Фрукты и ягоды", imageURL: "bag"),
            ]),
            .init(type: .category, headerTitle: "Мясо и рыба", themeColor: UIColor(hexString: "f08080"), items: [
                CategoryCatalogItem(title: "Мясо", imageURL: "bag"),
                CategoryCatalogItem(title: "Рыба", imageURL: "bag"),
                CategoryCatalogItem(title: "Колбаса и сосиски", imageURL: "bag"),
            ]),
            .init(type: .promo, headerTitle: "Еще больше интересного", items: [
                PromoCatalogItem(product: ProductData(
                    name: "Куча конфет без фото",
                    description: "куча",
                    imageURLsSet: [],
                    price: 200)),
                PromoCatalogItem(product: ProductData(
                    name: "Альтернативное молоко с тем же лого",
                    description: "750 мл",
                    imageURLsSet: ["promo_1"],
                    price: 340)),
                PromoCatalogItem(product: ProductData(
                    name: "Коровки няшные",
                    description: "5 шт",
                    imageURLsSet: ["promo_1"],
                    price: 110)),
                PromoCatalogItem(product: ProductData(
                    name: "Молоко Суперское",
                    description: "900 мл",
                    imageURLsSet: ["promo_1", "face.smiling"],
                    price: 79)),
            ]),
            .init(type: .category, headerTitle: "Сладкое и снеки", themeColor: UIColor(hexString: "ffecd1"), items: [
                CategoryCatalogItem(title: "Вафли и печенье", imageURL: "bag"),
                CategoryCatalogItem(title: "Сухофрукты и орехи", imageURL: "bag"),
                CategoryCatalogItem(title: "Шоколад и конфеты", imageURL: "bag"),
                CategoryCatalogItem(title: "Чипсы и снэки", imageURL: "bag"),
            ]),
        ]
    }
}
