//
//  PersistanceManager.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

protocol PersistanceManagerProtocol {
    func saveCategoryData(categoriesData: CategoriesModel)
    func saveEventData(eventData: EventModel)
    func fetchCatagoryData() -> CategoriesModel
    func fetchEventData(currentCategoryId: String) -> [EventModelElement]
}

final class PersistanceManager: PersistanceManagerProtocol {
    
    private let userDefaultClient = UserDefaultClient()
    private let usingDataBaseFlag = UsingDataBaseFlag()
    private let coreDataClient = CoreDataClient()
    private let realmClient = RealmClient()
    
    public func saveCategoryData(categoriesData: CategoriesModel) {
        switch usingDataBaseFlag.flag {
        case .coreData:
            coreDataClient.saveCategoryData(categoriesData: categoriesData)
        case .Realm:
            realmClient.saveCategoryData(categoriesData: categoriesData)
        }
        userDefaultClient.storeFlagHasCategoryData(isContain: true)
    }
    
    public func saveEventData(eventData: EventModel) {
        switch usingDataBaseFlag.flag {
        case .coreData:
            coreDataClient.saveEventData(eventData: eventData)
        case .Realm:
            realmClient.saveEventData(eventsData: eventData)
        }
        userDefaultClient.storeFlagHasEventData(isContain: true)
    }
    
    
    public func fetchCatagoryData() -> CategoriesModel {
        
        var categoriesData: CategoriesModel? = []
        
        switch usingDataBaseFlag.flag {
            
            // MARK: - CoreData
        case .coreData:
            
            DispatchQueue.global(qos: .userInitiated).sync {
                // MARK: - read data
                let CoreDataCategories = coreDataClient.readCategoryData()
                
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
                let data = realmClient.readCategoryData()
                data.forEach { category in
                    let currentCategory: CategoriesModelElement = CategoriesModelElement(id: category.id, title: category.title, image: category.image)
                    categoriesData?.append(currentCategory)
                }
        }
        return categoriesData ?? CategoriesModel()
    }
    
    
    public func fetchEventData(currentCategoryId: String) -> [EventModelElement] {
        
        let currentCategoryId: String = currentCategoryId
        var categoryNewsArray: [EventModelElement] = []
        
        switch usingDataBaseFlag.flag {
            
            // MARK: - CoreData
        case .coreData:
            
            DispatchQueue.global(qos: .userInitiated).sync {
                // MARK: - read data
                let eventDataCategories = coreDataClient.readEventData()
                
                // MARK: - convert coreData to our CategoriesModel
                let actionButtonData = coreDataClient.readActionButtonData()
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
            let data = realmClient.readEventData()
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
