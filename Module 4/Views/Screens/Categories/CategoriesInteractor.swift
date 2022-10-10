//
//  CategoriesInteractor.swift
//  Module 4
//
//  Created by Влад Бокин on 04.10.2022.
//

import Foundation

protocol CategoriesBisnesslogic {
    func requestCategories()
}

class CategoriesInteractor {
    private let dataServise = DataService()
    private var categoriesData: CategoriesEnum.ViewDidLoad.Response? = CategoriesEnum.ViewDidLoad.Response.init(categotiesArray: [])
    
    var presenter: CategoriesPresentationLogic?
}

// MARK: - Bisness Logic
extension CategoriesInteractor: CategoriesBisnesslogic {
    
    func requestCategories() {
        
        DispatchQueue.global(qos: .userInitiated).sync {
            // MARK: - Get data
            let data: CategoriesModel = dataServise.getCategories()
   
           
            categoriesData?.categotiesArray = []
            data.forEach { el in
                let categoriesElement: CategoriesEnum.ViewDidLoad.categoriesModel? = CategoriesEnum.ViewDidLoad.categoriesModel(id: el.id, title: el.title, image: el.image)
                
                
                self.categoriesData?.categotiesArray.append(categoriesElement)
            }
            
        }
        presenter?.presentData(data: self.categoriesData)
        
    }
    
}
