//
//  PersistanceManager.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

final class PersistanceManager {
    
    static func saveCategoryData(categoriesData: CategoriesModel) {
        switch UsingDataBaseFlag.flag {
        case .coreData:
            CoreDataClient.saveCategoryData(categoriesData: categoriesData)
        case .Realm:
            RealmClient.saveCategoryData(categoriesData: categoriesData)
        }
        UserDefaultClient.storeFlagHasData(isContain: true)
    }
    
    
    static func fetchCatagoryData() -> CategoriesModel {
        
        var categoriesData: CategoriesModel? = []
        
        switch UsingDataBaseFlag.flag {
            
            // MARK: - CoreData
        case .coreData:
            
            DispatchQueue.global(qos: .userInitiated).sync {
                // MARK: - read data
                let CoreDataCategories = CoreDataClient.readCategoryData()
                
                // MARK: - convert coreData to our CategoriesModel
                var i = 0
                for _ in CoreDataCategories {
                    let el = CategoriesModelElement(id: CoreDataCategories[i].id,
                                                    title: CoreDataCategories[i].title,
                                                    image: CoreDataCategories[i].image)
                    categoriesData?.append(el)
                    i += 1
                }
                
            }
            
            
            // MARK: - Realm
        case .Realm:
            DispatchQueue.global(qos: .userInitiated).sync {
                let data = RealmClient.readCategoryData()
                data.forEach { category in
                    let currentCategory: CategoriesModelElement = CategoriesModelElement(id: category.id, title: category.title, image: category.image)
                    categoriesData?.append(currentCategory)
                }
            }
        }
        return categoriesData ?? CategoriesModel()
    }
}

