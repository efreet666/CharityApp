//
//  CategoriesView.swift
//  Module 4
//
//  Created by Влад Бокин on 03.10.2022.
//

import UIKit

protocol CategoriesDisplayLogic: AnyObject {
        func displaySmth()
}

class CategoriesView: UIViewController {
    
    private var interactor: CategoriesBisnesslogic?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.requestCategories()
    }
    
    private func setup() {
        let viewController = self
        let presenter = CategoriesPresenter()
        let interactor = CategoriesInteractor()
        
        presenter.view = viewController
        interactor.presenter = presenter
        viewController.interactor = interactor
    }
    
}

extension CategoriesView: CategoriesDisplayLogic {
    
    func displaySmth() {
        
    }
}
