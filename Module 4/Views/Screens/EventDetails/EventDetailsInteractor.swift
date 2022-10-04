//
//  EventDetailsInteractor.swift
//  Module 4
//
//  Created by Влад Бокин on 04.10.2022.
//

import Foundation

protocol EventDetailsBusinessLogic: AnyObject {
    func fetchEventDetails()
}

protocol EventDetailsDataStore: AnyObject {
    var currentEventDetail: EventModelElement? { get set }
}

class EventDetailsInteractor: EventDetailsDataStore {
  
    var currentEventDetail: EventModelElement?

    
  var presenter: EventDetailsPresentationLogic?

}

extension EventDetailsInteractor: EventDetailsBusinessLogic {
    func fetchEventDetails() {
        presenter?.presentData(eventData: currentEventDetail! ) // Force unwrap - FIX
    }
    
    
}
