//
//  CategoriesService.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

final class CategoriesService {
    
    static func getCategories() -> CategoriesModel {
        
        var categoryData: CategoriesModel? = []
        
       // MARK: - Check if data
        if UserDefaultClient.retrieveFlagHasData() == true {
            return PersistanceManager.fetchCatagoryData()
        } else {
            categoryData = NetworkManager.fetchCategoryData()
            PersistanceManager.saveCategoryData(categoriesData: categoryData ?? CategoriesModel())
            categoryData = PersistanceManager.fetchCatagoryData()
        }
        
        return categoryData ?? CategoriesModel()
    }
    
}
