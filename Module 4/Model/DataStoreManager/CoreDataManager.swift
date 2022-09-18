//
//  CoreDataManeger.swift
//  Module 4
//
//  Created by Влад Бокин on 12.09.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    // MARK: - Save data to CoreData
    static func saveCategoryData() {
        // MARK: - check if data loaded from JSON
        if readCategoryData().isEmpty {
            let categoriesData = Bundle.main.decode(CategoriesModel.self, from: DataPath.categoryData)
            
            let storeManager = DataStoreManager()
            let context = storeManager.persistentContainer.viewContext
            
            guard let entity = NSEntityDescription.entity(forEntityName: "Categories", in: context) else { return }
            
            for el in categoriesData {
                let categoriesObject = Categories(entity: entity, insertInto: context)
                categoriesObject.title = el.title
                categoriesObject.image = el.image
                categoriesObject.id = el.id
                
                storeManager.saveContext()
            }
        }
    }
    
    static func saveEventData() {
        // MARK: - check if data loaded from JSON
        if readEventData().isEmpty && readActionButtonData().isEmpty {
            
            let eventData = Bundle.main.decode(EventModel.self, from: DataPath.eventData)
            
            let storeManager = DataStoreManager()
            let context = storeManager.persistentContainer.viewContext
            
            guard let entity = NSEntityDescription.entity(forEntityName: "Event", in: context) else { return }
            
            for event in eventData {
                
                guard let actionButtonEntity = NSEntityDescription.entity(forEntityName: "ActionButton", in: context) else { return }
                
                let eventEntityData = Event(entity: entity, insertInto: context)
                eventEntityData.title = event.title
                eventEntityData.category = event.category
                eventEntityData.id = event.id
                eventEntityData.adress = event.adress
                eventEntityData.fond = event.fond
                eventEntityData.infoText = event.infoText
                eventEntityData.images = event.images
                eventEntityData.subTitle = event.subTitle
                eventEntityData.timeout = event.timeout
                eventEntityData.phones = event.phones
                
                event.actionButtons?.forEach({ button in
                    
                    let actionButtonData = ActionButton(entity: actionButtonEntity, insertInto: context)
                    var actionButtonArray: [NSObject] = []
                    actionButtonData.buttonID = button.buttonID
                    actionButtonData.buttonTitle = button.buttonTitle
                    actionButtonArray.append(actionButtonData)
                    eventEntityData.actionButtons = event.actionButtons.map { $0 } as? [ActionButton]
                })
                
                storeManager.saveContext()
                eventEntityData.actionButtons? = []
            }
        }
    }
    
    // MARK: - Read data from CoreData
    
    static func readCategoryData() -> ([Categories]) {
        var categories = [Categories]()
        
        let storeManeger = DataStoreManager()
        let context = storeManeger.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Categories> = Categories.fetchRequest()
        
        do {
            categories = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return categories
    }
    
    static func readEventData() -> ([Event]) {
        var events = [Event]()
        
        let storeManeger = DataStoreManager()
        let context = storeManeger.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        
        do {
            events = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return events
    }
    
    static func readActionButtonData() -> ([ActionButton]) {
        var actionButton = [ActionButton]()
        
        let storeManeger = DataStoreManager()
        let context = storeManeger.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<ActionButton> = ActionButton.fetchRequest()
        
        do {
            actionButton = try context.fetch(fetchRequest)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return actionButton
    }
}
