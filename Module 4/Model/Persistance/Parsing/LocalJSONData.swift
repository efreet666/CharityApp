//
//  LocalJSONData.swift
//  Module 4
//
//  Created by Влад Бокин on 21.09.2022.
//

import Foundation

class LocalJSONData {
    
    static func parseCategoryDataFromJSON() -> CategoriesModel {
        return Bundle.main.decode(CategoriesModel.self, from: DataPath.categoryData)
    }
    
    static func parseEventDataFromJSON() -> EventModel {
        return Bundle.main.decode(EventModel.self, from: DataPath.eventData)
    }
    
}
