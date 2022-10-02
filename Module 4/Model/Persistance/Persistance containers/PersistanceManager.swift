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
        UserDefaultClient.storeFlagHasCategoryData(isContain: true)
    }
    
    static func saveEventData(eventData: EventModel) {
        switch UsingDataBaseFlag.flag {
        case .coreData:
            CoreDataClient.saveEventData(eventData: eventData)
        case .Realm:
            RealmClient.saveEventData(eventsData: eventData)
        }
        UserDefaultClient.storeFlagHasEventData(isContain: true)
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
    
    
    static func fetchEventData(currentCategoryId: String) -> [EventModelElement] {
        
        let currentCategoryId: String = currentCategoryId
        var categoryNewsArray: [EventModelElement] = []
        
        switch UsingDataBaseFlag.flag {
            
            // MARK: - CoreData
        case .coreData:
            
            DispatchQueue.global(qos: .userInitiated).sync {
                // MARK: - read data
                let eventDataCategories = CoreDataClient.readEventData()
                
                // MARK: - convert coreData to our CategoriesModel
                let actionButtonData = CoreDataClient.readActionButtonData()
                var currentEventArray: [EventModelElement] = []
                var i = 0
                var actionButtons : [EventActionButton]? = []
                
                for _ in eventDataCategories {
                    
                    for action in actionButtonData {
                        actionButtons?.append(EventActionButton(buttonTitle: action.buttonTitle, buttonID: action.buttonID))
                    }
                    
                    let el = EventModelElement(id: eventDataCategories[i].id,
                                               category: eventDataCategories[i].category,
                                               images: eventDataCategories[i].images,
                                               title: eventDataCategories[i].title,
                                               subTitle: eventDataCategories[i].subTitle,
                                               timeout: eventDataCategories[i].timeout,
                                               fond: eventDataCategories[i].fond,
                                               adress: eventDataCategories[i].adress,
                                               phones: eventDataCategories[i].phones,
                                               infoText: eventDataCategories[i].infoText,
                                               actionButtons: actionButtons)
                    
                    currentEventArray.append(el)
                    i += 1
                    actionButtons = []
                }
                
                // MARK: - filter category array by id
                currentEventArray.forEach { (event) in
                    let currentCategoryArray = event.category!.compactMap { $0 as String }
                    if currentCategoryArray.contains(currentCategoryId) {
                        categoryNewsArray.append(event)
                    }
                }
                
            }
            
            
            // MARK: - Realm
        case .Realm:
            let data = RealmClient.readEventData()
            var currentEventArray: [EventModelElement] = []
            
            // MARK: - create action buttons array
            data.forEach { currentEvent in
                var actionButtonArray : [EventActionButton]? = []
                currentEvent.actionButtons.forEach { event in
                    actionButtonArray?.append(EventActionButton(buttonTitle: event.buttonTitle, buttonID: event.buttonID))
                }
                
                // MARK: - create category element
                let currentCategory: EventModelElement = EventModelElement(id: currentEvent.id,
                                                                           category: Array(currentEvent.category),
                                                                           images: Array(currentEvent.images),
                                                                           title: currentEvent.title,
                                                                           subTitle: currentEvent.subTitle,
                                                                           timeout: currentEvent.timeout,
                                                                           fond: currentEvent.fond,
                                                                           adress: currentEvent.adress,
                                                                           phones: currentEvent.phones,
                                                                           infoText: currentEvent.infoText,
                                                                           actionButtons: actionButtonArray )
                currentEventArray.append(currentCategory)
                print(currentCategory)
            }
            
            // MARK: - filter category array by id
            currentEventArray.forEach { (event) in
                let currentCategoryArray = event.category!.compactMap { $0 as String }
                if currentCategoryArray.contains(currentCategoryId) {
                    categoryNewsArray.append(event)
                }
            }
        }
        return categoryNewsArray
    }

}
