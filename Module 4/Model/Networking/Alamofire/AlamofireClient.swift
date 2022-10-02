//
//  AlamofireClient.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

final class AlamofireClient {
    
    static func fetchCategoryData() -> CategoriesModel {
        
        var categoryData: CategoriesModel?
        
        AlamofireManager.requestCategoryData(NetworkingURL.categoryURL) { result in
            switch result {
            case .success(let categoriesData):
                print(categoriesData)
                categoryData = categoriesData
            case .failure(let err):
                print(err)
            }
        }
        return categoryData ?? CategoriesModel()
    }
    
    static func fetchEventData() -> EventModel {
        
        var eventData: EventModel?
        
        AlamofireManager.requestEventData(NetworkingURL.eventURL) { result in
            switch result {
            case .success(let data):
                print(data)
                eventData = data
            case .failure(let err):
                print(err)
            }
        }
        return eventData ?? EventModel()
    }
}

