//
//  LocalJSONData.swift
//  Module 4
//
//  Created by Влад Бокин on 21.09.2022.
//

import Foundation

final class LocalJSONData {
    
    private let dataPath = DataPath()
    
    public func parseCategoryDataFromJSON() -> CategoriesModel {
        return Bundle.main.decode(CategoriesModel.self, from: dataPath.categoryData)
    }
    
    public func parseEventDataFromJSON() -> EventModel {
        return Bundle.main.decode(EventModel.self, from: dataPath.eventData)
    }
    
}
