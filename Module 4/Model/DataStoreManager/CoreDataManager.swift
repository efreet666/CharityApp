//
//  CoreDataManeger.swift
//  Module 4
//
//  Created by Влад Бокин on 12.09.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static func saveData() {
        // MARK: - check if data loaded from JSON
        if readData().isEmpty {
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
    
    static func readData() -> ([Categories]) {
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
    
}
