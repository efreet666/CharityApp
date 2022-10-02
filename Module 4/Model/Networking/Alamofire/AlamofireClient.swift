//
//  AlamofireClient.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

class AlamofireClient {
    
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
    
}

