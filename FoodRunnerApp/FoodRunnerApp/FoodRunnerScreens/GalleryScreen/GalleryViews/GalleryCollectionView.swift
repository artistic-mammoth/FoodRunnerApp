//
//  GalleryCollectionView.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 18.08.2023.
//

import UIKit

final class GalleryCollectionView: UIView {
    /// Data for present in catalog view
    var galleryData: GalleryData = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Private properties
    private var collectionView: UICollectionView!
    
    // MARK: - Init
    @available (*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        guard let layout = createCollectionViewLayout() else { fatalError("Cannot create layout") }
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        setupView()
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension GalleryCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        galleryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        galleryData[section].items.count
    }

    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        let cell = collectionView.cellForItem(at: indexPath)
    //        animateTappedCell(cell) { [weak self] in
    //            // TODO: - Update when will set ID
    //            guard let data = self?.catalogData[indexPath.section].type else { return }
    //            guard let id = self?.catalogData[indexPath.section].items[indexPath.row].id else { return }
    //            self?.delegate?.didSelectItem(id: id, type: data)
    //        }
    //    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryProductCell.reuseIdentifier, for: indexPath) as? GalleryProductCell else { fatalError("Cannot create new cell") }
        
//        let item = galleryData[indexPath.section].items[indexPath.row]
        
        cell.configureWith()
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CatalogCategoryHeaderReusableView.reuseIdentifier, for: indexPath) as? CatalogCategoryHeaderReusableView else { fatalError("Cannot create new reusable view") }
            
            let titleName = galleryData[indexPath.section].headerTitle
            header.configureWith(label: titleName)
            
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: - Private extension
private extension GalleryCollectionView {
    func setupView() {
        addViews(collectionView)
        
        configureCollectionView()
        
        backgroundColor = .clear
        collectionView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(GalleryProductCell.self, forCellWithReuseIdentifier: GalleryProductCell.reuseIdentifier)
        
        collectionView.register(CatalogCategoryHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CatalogCategoryHeaderReusableView.reuseIdentifier)
    }
    
    func createCollectionViewLayout() -> UICollectionViewCompositionalLayout? {
        UICollectionViewCompositionalLayout {sectionIndex, _ in
            return CompositionalLayoutConfigurator.getSectionLayoutWithHorizontalGroup(
                itemWidth: .fractionalWidth(1/3),
                groupHeight: .estimated(160),
                supplementaryItems: [CompositionalLayoutConfigurator.getTitleHeader()],
                itemContentInsets: .init(top: 3, leading: 3, bottom: 3, trailing: 3))
        }
    }
}

