//
//  GalleryData.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 18.08.2023.
//

import Foundation

/// Home catalog submission data
typealias GalleryData = [GallerySection]

struct GallerySection {
    let headerTitle: String
    let items: [GalleryItem]
}

struct GalleryItem {
    let id: String
    let name: String
}
