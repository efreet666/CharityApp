//
//  CategoriesInteractor.swift
//  Module 4
//
//  Created by Влад Бокин on 04.10.2022.
//

import Foundation

protocol CategoriesBisnesslogic {
    func requestCategories() -> CategoriesModel
}

class CategoriesInteractor {
    
    var presenter: CategoriesPresentationLogic?
}

// MARK: - Bisness Logic
extension CategoriesInteractor: CategoriesBisnesslogic {
    
    func requestCategories() -> CategoriesModel {
        presenter?.presentData()
        
        return CategoriesModel()
    }
    
}
