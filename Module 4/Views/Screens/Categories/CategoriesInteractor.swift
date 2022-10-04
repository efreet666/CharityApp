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
    private var categoriesData: CategoriesModel? = []
    
    var presenter: CategoriesPresentationLogic?
}

// MARK: - Bisness Logic
extension CategoriesInteractor: CategoriesBisnesslogic {
    
    func requestCategories() {
        
        DispatchQueue.global(qos: .userInitiated).sync {
            // MARK: - Get data
            self.categoriesData = dataServise.getCategories()
        }
        
        presenter?.presentData(data: self.categoriesData ?? CategoriesModel())
        
    }
    
}
