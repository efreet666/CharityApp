//
//  NetworkManager.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

class NetworkManager {
    
    static func fetchCategoryData() -> CategoriesModel {
        
        var categoriesModelData: CategoriesModel? = [] 
        
        // MARK: - Check flag
        switch UsingNetworkServiceFlag.flag {
            
        case .URLSession:
            categoriesModelData = URLSessionClient.fetchCategoryData()
            
        case .Alamofire:
            categoriesModelData = AlamofireClient.fetchCategoryData()
        }
        
        
        // MARK: - Check if data == nil, parse from LocalJSON
        if categoriesModelData?.count == 0 {
            categoriesModelData = LocalJSONData.parseCategoryDataFromJSON()
            return categoriesModelData ?? CategoriesModel()
        } else {
            return categoriesModelData ?? CategoriesModel()
        }
    }
}
