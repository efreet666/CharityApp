//
//  RealmDataManager.swift
//  Module 4
//
//  Created by Влад Бокин on 18.09.2022.
//

import Foundation
import RealmSwift

final class RealmClient {
    
    public func saveCategoryData(categoriesData: CategoriesModel) {
        
        let realm = try! Realm()
        
        if realm.objects(Category.self).isEmpty {
            
            for categoryData in categoriesData {
                let categories = Category()
                let realm = try! Realm()
                
                categories.id = categoryData.id ?? ""
                categories.title = categoryData.title ?? ""
                categories.image = categoryData.image ?? ""
                
                try! realm.write {
                    realm.add(categories)
                }
            }
        }
    }
    
    public func saveEventData(eventsData: EventModel) {
        let realm = try! Realm()
        
        if realm.objects(Events.self).isEmpty {
            
            for eventData in eventsData {
                
                let events = Events()
                
                events.id = eventData.id ?? ""
                events.title = eventData.title ?? ""
                events.subTitle = eventData.subTitle ?? ""
                events.timeout = eventData.timeout ?? ""
                events.fond = eventData.fond ?? ""
                events.adress = eventData.adress ?? ""
                events.phones = eventData.phones ?? ""
                events.infoText = eventData.infoText ?? ""
                events.id = eventData.id ?? ""
                
                events.category.append(objectsIn: eventData.category ?? [] )
                events.images.append(objectsIn: eventData.images ?? [] )
                
                eventData.actionButtons?.forEach { button in
                    let actionButton = ActionButtons()
                    actionButton.buttonTitle = button.buttonTitle ?? ""
                    actionButton.buttonID = button.buttonID ?? ""
                    events.actionButtons.append(actionButton)
                }
                
                try! realm.write {
                    realm.add(events)
                }
            }
        }
    }
    
    public func readCategoryData() -> (Results<Category>) {
        let realm = try! Realm()
        return realm.objects(Category.self)
    }
    
    public func readEventData() -> (Results<Events>) {
        let realm = try! Realm()
        return realm.objects(Events.self)
    }
    
}
