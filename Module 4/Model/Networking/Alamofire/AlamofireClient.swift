//
//  AlamofireClient.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

final class AlamofireClient {
    
    private let networkingURLManager = NetworkingURLManager()
    
    func fetchCategoryData() -> CategoriesModel {
        
        
        var categoryData: CategoriesModel?
        
        AlamofireManager.requestCategoryData(networkingURLManager.stringToURL(urlString: URLString.categoryURL.rawValue)!) { result in
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
    
    func fetchEventData() -> EventModel {
        
        var eventData: EventModel?
        
        AlamofireManager.requestEventData(networkingURLManager.stringToURL(urlString: URLString.eventURL.rawValue)!) { result in
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

