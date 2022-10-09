//
//  CategoriesPresenter.swift
//  Module 4
//
//  Created by Влад Бокин on 03.10.2022.
//

import Foundation
import UIKit

protocol CategoriesPresentationLogic {
    func presentData(data: CategoriesEnum.ViewDidLoad.Response?)
}

class CategoriesPresenter {
    
    // MARK: - External vars
    weak var viewController: CategoriesDisplayLogic?
}

// MARK: - Presentation Logic
extension CategoriesPresenter: CategoriesPresentationLogic {
    func presentData(data: CategoriesEnum.ViewDidLoad.Response?) {
        
        
        let viewModel = CategoriesEnum.ViewDidLoad.ViewModel.init(categotiesArray: data!.categotiesArray)
        
        viewController?.display(categoriesData: viewModel)
    }
}
