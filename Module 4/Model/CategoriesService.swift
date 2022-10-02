//
//  CategoriesService.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

class CategoriesService {
    
    static func getCategories() -> CategoriesModel {
        
        var categoryData: CategoriesModel? = []
        
       // MARK: - Check if data
        if UserDefaultClient.retrieveFlagHasData() == true {
            print(PersistanceManager.fetchCatagoryData())
            return PersistanceManager.fetchCatagoryData()
        } else {
            
            
            
            categoryData = NetworkManager.fetchCategoryData()
            PersistanceManager.saveCategoryData(categoriesData: categoryData ?? CategoriesModel())
            categoryData = PersistanceManager.fetchCatagoryData()
            print(categoryData)
        }
        
        return categoryData ?? CategoriesModel()
    }
    
}
