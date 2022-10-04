//
//  EventsPresenter.swift
//  Module 4
//
//  Created by Влад Бокин on 04.10.2022.
//

import Foundation

protocol EventsPresentationLogic: AnyObject {
    func presentData(data: EventModel, currentCategoryTitle: String)
}

final class EventsPresenter {
    
  weak var viewController: EventsDisplayLogic?

}

extension EventsPresenter: EventsPresentationLogic {
    func presentData(data: EventModel, currentCategoryTitle: String) {
        let viewModel = data
        viewController?.display(eventData: viewModel, currentCategoryTitle: currentCategoryTitle)
    }
    
    
}
