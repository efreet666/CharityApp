//
//  CoreDataManeger.swift
//  Module 4
//
//  Created by Влад Бокин on 12.09.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
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
            
            for el in eventData {
                
                guard let actionButtonEntity = NSEntityDescription.entity(forEntityName: "ActionButton", in: context) else { return }
                
                let eventEntityData = Event(entity: entity, insertInto: context)
                eventEntityData.title = el.title
                eventEntityData.category = el.category
                eventEntityData.id = el.id
                eventEntityData.adress = el.adress
                eventEntityData.fond = el.fond
                eventEntityData.infoText = el.infoText
                eventEntityData.images = el.images
                eventEntityData.subTitle = el.subTitle
                eventEntityData.timeout = el.timeout
                eventEntityData.phones = el.phones
                
                el.actionButtons?.forEach({ el1 in
                    
                    let actionButtonData = ActionButton(entity: actionButtonEntity, insertInto: context)
                    var actionButtonArray: [NSObject] = []
                    actionButtonData.buttonID = el1.buttonID
                    actionButtonData.buttonTitle = el1.buttonTitle
                    actionButtonArray.append(actionButtonData)
                    eventEntityData.actionButtons = el.actionButtons.map { $0 } as? [NSObject]
                })
                
                storeManager.saveContext()
                eventEntityData.actionButtons? = []
            }
        }
    }
    
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
