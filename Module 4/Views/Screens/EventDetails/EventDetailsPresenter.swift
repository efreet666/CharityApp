//
//  EventDetailsPresenter.swift
//  Module 4
//
//  Created by Влад Бокин on 04.10.2022.
//

import Foundation

protocol EventDetailsPresentationLogic: AnyObject {
    func presentData(eventData: EventModelElement)
}

final class EventDetailsPresenter {

    weak var viewController: EventDetailsDisplayLogic?

}

extension EventDetailsPresenter: EventDetailsPresentationLogic {
    func presentData(eventData: EventModelElement) {
        let viewModel = eventData
        viewController?.display(detailEventData: viewModel)
    }
    
    
}
