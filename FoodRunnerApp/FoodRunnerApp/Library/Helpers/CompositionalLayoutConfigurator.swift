//
//  CompositionalLayoutConfigurator.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 13.08.2023.
//

import UIKit

class CompositionalLayoutConfigurator {
    static func getSectionLayoutWithHorizontalGroup(
        itemWidth: NSCollectionLayoutDimension = .fractionalWidth(1),
        itemHeight: NSCollectionLayoutDimension = .fractionalHeight(1),
        groupWidth: NSCollectionLayoutDimension = .fractionalWidth(1),
        groupHeight: NSCollectionLayoutDimension = .fractionalHeight(1),
        scrollType: UICollectionLayoutSectionOrthogonalScrollingBehavior = .none,
        supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem] = [],
        itemContentInsets: NSDirectionalEdgeInsets = .zero) -> NSCollectionLayoutSection {
            
            let item = NSCollectionLayoutItem(
                layoutSize: .init(
                    widthDimension: itemWidth,
                    heightDimension: itemHeight))
            
            item.contentInsets = itemContentInsets

            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(
                    widthDimension: groupWidth,
                    heightDimension: groupHeight),
                subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.orthogonalScrollingBehavior = scrollType
            section.boundarySupplementaryItems = supplementaryItems
            
            return section
        }
    
    static func getTitleHeader() -> NSCollectionLayoutBoundarySupplementaryItem{
        NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(80)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
    }
}
