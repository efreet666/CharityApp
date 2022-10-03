//
//  AlamofireClient.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

final class AlamofireClient {
    
    private let networkingURL = NetworkingURL()
    
    public func fetchCategoryData() -> CategoriesModel {
        
        var categoryData: CategoriesModel?
        
        AlamofireManager.requestCategoryData(networkingURL.categoryURL) { result in
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
    
    public func fetchEventData() -> EventModel {
        
        var eventData: EventModel?
        
        AlamofireManager.requestEventData(networkingURL.eventURL) { result in
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

