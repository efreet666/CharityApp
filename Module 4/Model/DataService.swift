//
//  DataService.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

final class DataService {
    
    private let userDefaultClient = UserDefaultClient()
    private let persistanceManager = PersistanceManager()
    private let networkManager = NetworkManager()
    
    // MARK: - Categories
    public func getCategories() -> CategoriesModel {
        var categoryData: CategoriesModel? = []
        
       // MARK: - Check if data
        if userDefaultClient.retrieveFlagHasCategoryData() == true {
            return persistanceManager.fetchCatagoryData()
        } else {
            categoryData = networkManager.fetchCategoryData()
            persistanceManager.saveCategoryData(categoriesData: categoryData ?? CategoriesModel())
            categoryData = persistanceManager.fetchCatagoryData()
        }
        
        return categoryData ?? CategoriesModel()
    }
    
    // MARK: - Events
    public func getEvents(currentCategoryId: String) -> EventModel {
        var eventData: EventModel? = []
        
       // MARK: - Check if data
        if userDefaultClient.retrieveFlagHasEventData() == true {
            return persistanceManager.fetchEventData(currentCategoryId: currentCategoryId)
        } else {
            eventData = networkManager.fetchEventData()
            persistanceManager.saveEventData(eventData: eventData ?? EventModel())
            eventData = persistanceManager.fetchEventData(currentCategoryId: currentCategoryId)
        }
        return eventData ?? EventModel()
    }
    
    
    
}
