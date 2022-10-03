//
//  NetworkManager.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

final class NetworkManager {
    
    private let urlSessionClient = URLSessionClient()
    private let alamofireClient = AlamofireClient()
    private let localJSONData = LocalJSONData()
    private let usingNetworkServiceFlag = UsingNetworkServiceFlag()
    
    public func fetchCategoryData() -> CategoriesModel {
        
        var categoriesModelData: CategoriesModel? = [] 
        
        // MARK: - Check flag
        switch usingNetworkServiceFlag.flag {
            
        case .URLSession:
            categoriesModelData = urlSessionClient.fetchCategoryData()
            
        case .Alamofire:
            categoriesModelData = alamofireClient.fetchCategoryData()
        }
        
        
        // MARK: - Check if data == nil, parse from LocalJSON
        if categoriesModelData?.count == 0 {
            categoriesModelData = localJSONData.parseCategoryDataFromJSON()
            return categoriesModelData ?? CategoriesModel()
        } else {
            return categoriesModelData ?? CategoriesModel()
        }
    }
    
    public func fetchEventData() -> EventModel {
        
        var EventModelData: EventModel? = []
        
        // MARK: - Check flag
        switch usingNetworkServiceFlag.flag {
            
        case .URLSession:
            EventModelData = urlSessionClient.fetchEventData()
            
        case .Alamofire:
            EventModelData = alamofireClient.fetchEventData()
        }
        
        
        // MARK: - Check if data == nil, parse from LocalJSON
        if EventModelData?.count == 0 {
            EventModelData = localJSONData.parseEventDataFromJSON()
            return EventModelData ?? EventModel()
        } else {
            return EventModelData ?? EventModel()
        }
    }
}
