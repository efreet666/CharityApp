//
//  CategoriesModels.swift
//  Module 4
//
//  Created by Влад Бокин on 05.10.2022.
//

import Foundation

enum CategoriesEnum {
    
    enum ViewDidLoad {
        
        struct Request {
        }
        
        struct Response {
            var categotiesArray: [categoriesModel?]
        }
        
        struct ViewModel {
            var categotiesArray: [categoriesModel?]
        }
        
        struct categoriesModel {
            var id: String?
            var title: String?
            var image: String?
        }
    }
}
