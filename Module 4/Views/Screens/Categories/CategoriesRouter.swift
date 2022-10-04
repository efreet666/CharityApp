//
//  CategoriesRouter.swift
//  Module 4
//
//  Created by Влад Бокин on 04.10.2022.
//

import Foundation

protocol CategoriesRoutingLogic: AnyObject {
    func navigateToEvents(currentCategoryTitle: String, currentCategoryId: String)
}

class CategoriesRouter {
    weak var viewController: CategoriesController?
    
}

extension CategoriesRouter: CategoriesRoutingLogic {
    func navigateToEvents(currentCategoryTitle: String, currentCategoryId: String) {

        let eventsVC = EventsController()
        eventsVC.router?.dataStore?.currentCategoryTitle = currentCategoryTitle
        eventsVC.router?.dataStore?.currentCategoryId = currentCategoryId
        
        viewController?.hidesBottomBarWhenPushed = false
        viewController?.navigationController?.pushViewController(eventsVC, animated: true)
        
    }
    
    
}
