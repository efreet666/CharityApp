//
//  DataService.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

protocol DataServiceProtocol {
    func getCategories() -> CategoriesModel
    func getEvents(currentCategoryId: String) -> EventModel
}

final class DataService: DataServiceProtocol {
    
    private let userDefaultClient = UserDefaultClient()
    private let persistanceManager = PersistanceManager()
    private let networkManager = NetworkManager()
    
    // MARK: - Categories
    func getCategories() -> CategoriesModel {
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
    func getEvents(currentCategoryId: String) -> EventModel {
        var eventData: EventModel? = []
        
       // MARK: - Check if data
        if userDefaultClient.retrieveFlagHasEventData() == true {
            print(persistanceManager.fetchEventData(currentCategoryId: currentCategoryId))
            return persistanceManager.fetchEventData(currentCategoryId: currentCategoryId)
        } else {
            eventData = networkManager.fetchEventData()
            persistanceManager.saveEventData(eventData: eventData ?? EventModel())
            eventData = persistanceManager.fetchEventData(currentCategoryId: currentCategoryId)
        }
        print(eventData)
        return eventData ?? EventModel()
    }
    
}
