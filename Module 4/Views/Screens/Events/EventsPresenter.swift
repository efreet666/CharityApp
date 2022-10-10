//
//  EventsPresenter.swift
//  Module 4
//
//  Created by Влад Бокин on 04.10.2022.
//

import Foundation

protocol EventsPresentationLogic: AnyObject {
    func presentData(data: EventsEnum.ViewDidLoad.Response)
}

final class EventsPresenter {
    
  weak var viewController: EventsDisplayLogic?

}

extension EventsPresenter: EventsPresentationLogic {
    func presentData(data: EventsEnum.ViewDidLoad.Response) {
        let viewModel: EventsEnum.ViewDidLoad.ViewModel =  EventsEnum.ViewDidLoad.ViewModel(EventArray: data.EventArray, currentCategoryTitle: data.currentCategoryTitle)
        
        viewController?.display(viewModel: viewModel)
    }
    
    
}
