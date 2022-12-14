//
//  CategoriesAdapter.swift
//  Module 4
//
//  Created by Влад Бокин on 06.10.2022.
//

import Foundation
import UIKit

class CategoriesAdapter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var categoriesData: CategoriesEnum.ViewDidLoad.ViewModel? = CategoriesEnum.ViewDidLoad.ViewModel.init(categotiesArray: [])
    
    var delegate: CellTapDelegate?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = categoriesData?.categotiesArray.count {
            return count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = UIColor.lightGreyColor
        cell.setup(image: UIImage(named: "\(categoriesData?.categotiesArray[indexPath.row]?.image ?? "")") ?? UIImage()
                   ,text: categoriesData?.categotiesArray[indexPath.row]?.title ?? "")
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentCategoryTitle = categoriesData?.categotiesArray[indexPath.row]?.title ?? ""
        let currentCategoryId = categoriesData?.categotiesArray[indexPath.row]?.id ?? ""
        
        delegate?.cellTap(currentCategoryTitle: currentCategoryTitle, currentCategoryId: currentCategoryId)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                           withReuseIdentifier: HeaderCollectionReusableView.identifier,
                                                                           for: indexPath) as? HeaderCollectionReusableView else  { return UICollectionReusableView()}
        // MARK: - configure header
        header.configure()
        return header
    }
}

