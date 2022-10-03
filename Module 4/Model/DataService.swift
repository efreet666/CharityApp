//
//  DataService.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

final class DataService {
    
    // MARK: - Categories
    static func getCategories() -> CategoriesModel {
        var categoryData: CategoriesModel? = []
        
       // MARK: - Check if data
        if UserDefaultClient.retrieveFlagHasCategoryData() == true {
            return PersistanceManager.fetchCatagoryData()
        } else {
            categoryData = NetworkManager.fetchCategoryData()
            PersistanceManager.saveCategoryData(categoriesData: categoryData ?? CategoriesModel())
            categoryData = PersistanceManager.fetchCatagoryData()
        }
        
        return categoryData ?? CategoriesModel()
    }
    
    // MARK: - Events
    static func getEvents(currentCategoryId: String) -> EventModel {
        var eventData: EventModel? = []
        
       // MARK: - Check if data
        if UserDefaultClient.retrieveFlagHasEventData() == true {
            return PersistanceManager.fetchEventData(currentCategoryId: currentCategoryId)
        } else {
            eventData = NetworkManager.fetchEventData()
            PersistanceManager.saveEventData(eventData: eventData ?? EventModel())
            eventData = PersistanceManager.fetchEventData(currentCategoryId: currentCategoryId)
        }
        return eventData ?? EventModel()
    }
    
    
    
}
