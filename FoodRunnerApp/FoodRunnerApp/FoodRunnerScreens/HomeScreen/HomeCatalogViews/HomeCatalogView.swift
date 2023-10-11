//
//  HomeCatalogView.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 13.08.2023.
//

import UIKit

protocol HomeCatalogViewDelegate: UIViewController {
    func didSelectItem(id: String, type: CatalogSectionType)
}

final class HomeCatalogView: UIView {
    // MARK: - Public properties
    weak var delegate: HomeCatalogViewDelegate?
    
    /// Data for present in catalog view
    var catalogData: CatalogData = [] {
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
extension HomeCatalogView: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        catalogData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        catalogData[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        animateHighlightCell(cell) {}
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        animateUnhighlightCell(cell)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        animateTappedCell(cell) { [weak self] in
            // TODO: - Update when will set ID
            guard let data = self?.catalogData[indexPath.section].type else { return }
            guard let id = self?.catalogData[indexPath.section].items[indexPath.row].id else { return }
            self?.delegate?.didSelectItem(id: id, type: data)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch catalogData[indexPath.section].type {
        case .category:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell else { fatalError("Cannot create new cell") }
            
            guard let item = catalogData[indexPath.section].items[indexPath.row] as? CategoryCatalogItem else { fatalError("Cannot get item") }
            
            let titleName = item.title
            let bgColor = catalogData[indexPath.section].themeColor
            let imageURL = item.imageURL
            cell.configureWith(label: titleName, color: bgColor, imageURL: imageURL)
            
            return cell
            
        case .promo:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoCell.reuseIdentifier, for: indexPath) as? PromoCell else { fatalError("Cannot create new cell") }
            
            guard let item = catalogData[indexPath.section].items[indexPath.row] as? PromoCatalogItem else { fatalError("Cannot get item") }
            
            cell.configureWith(name: item.name, description: item.description, price: item.price, imageURL: item.imageURL)
            
            return cell
            
        case .bigPromo:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigPromoCell.reuseIdentifier, for: indexPath) as? BigPromoCell else { fatalError("Cannot create new cell") }
            
            guard let item = catalogData[indexPath.section].items[indexPath.row] as? BigPromoCatalogItem else { fatalError("Cannot get item") }
            
            cell.configureWith(label: item.title, imageURL: item.imageURL)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CatalogCategoryHeaderReusableView.reuseIdentifier, for: indexPath) as? CatalogCategoryHeaderReusableView else { fatalError("Cannot create new reusable view") }
            
            let titleName = catalogData[indexPath.section].headerTitle
            header.configureWith(label: titleName)
            
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: - Private extension
private extension HomeCatalogView {
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
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        collectionView.register(PromoCell.self, forCellWithReuseIdentifier: PromoCell.reuseIdentifier)
        collectionView.register(BigPromoCell.self, forCellWithReuseIdentifier: BigPromoCell.reuseIdentifier)
        
        collectionView.register(CatalogCategoryHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CatalogCategoryHeaderReusableView.reuseIdentifier)
        
    }
    
    func createCollectionViewLayout() -> UICollectionViewCompositionalLayout? {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            switch self.catalogData[sectionIndex].type {
            case .category:
                return CompositionalLayoutConfigurator.getSectionLayoutWithHorizontalGroup(
                    itemWidth: .fractionalWidth(1/3),
                    groupHeight: .fractionalWidth(1/3),
                    supplementaryItems: [CompositionalLayoutConfigurator.getTitleHeader()],
                    itemContentInsets: .init(top: 3, leading: 3, bottom: 3, trailing: 3))
            case .promo:
                return CompositionalLayoutConfigurator.getSectionLayoutWithHorizontalGroup(
                    groupWidth: .fractionalWidth(0.8),
                    groupHeight: .absolute(100),
                    scrollType: .groupPaging,
                    supplementaryItems: [CompositionalLayoutConfigurator.getTitleHeader()],
                    itemContentInsets: .init(top: 3, leading: 3, bottom: 3, trailing: 3))
            case .bigPromo:
                return CompositionalLayoutConfigurator.getSectionLayoutWithHorizontalGroup(
                    groupWidth: .fractionalWidth(0.4),
                    groupHeight: .fractionalHeight(0.3),
                    scrollType: .continuous,
                    itemContentInsets: .init(top: 3, leading: 3, bottom: 3, trailing: 3))
            }
        }
    }
    
    // FIXME: - Make completion оptional and make more better animation
    func animateTappedCell(_ cell: UIView?, completion: @escaping ()->()?) {
        animateHighlightCell(cell) { [weak self] in
            self?.animateUnhighlightCell(cell)
            completion()
        }
    }
    
    func animateHighlightCell(_ cell: UIView?, completion: @escaping ()->()?) {
        UIView.animate(withDuration: 0.2) {
            cell?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            cell?.alpha = 0.9
        } completion: { _ in
            completion()
        }
    }
    
    func animateUnhighlightCell(_ cell: UIView?) {
        UIView.animate(withDuration: 0.2) {
            cell?.transform = .identity
            cell?.alpha = 1
        }
    }
}
