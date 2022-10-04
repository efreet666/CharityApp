//
//  CategoriesPresenter.swift
//  Module 4
//
//  Created by Влад Бокин on 03.10.2022.
//

import Foundation

protocol CategoriesPresentationLogic {
    func presentData(data: CategoriesModel)
}

class CategoriesPresenter {
    
    // MARK: - External vars
    weak var view: CategoriesDisplayLogic?
}

// MARK: - Presentation Logic
extension CategoriesPresenter: CategoriesPresentationLogic {
    func presentData(data: CategoriesModel) {
        let viewModel = data
        
        view?.display(categoriesData: viewModel)
    }
}
