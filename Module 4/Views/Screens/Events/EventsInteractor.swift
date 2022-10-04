//
//  EventsInteractor.swift
//  Module 4
//
//  Created by Влад Бокин on 04.10.2022.
//

import Foundation

protocol EventsBusinessLogic: AnyObject {
  func fetchEvents()
}

protocol EventsDataStore: AnyObject {
    var currentCategoryTitle: String { get set}
    var currentCategoryId: String { get set }
}

class EventsInteractor:  EventsDataStore {
    private let dataServise = DataService()
    
    var currentCategoryTitle: String = ""
    var currentCategoryId: String = ""
    
    private var categoryNewsArray: EventModel = []

  var presenter: EventsPresentationLogic?

}

extension EventsInteractor: EventsBusinessLogic {
    func fetchEvents() {
        DispatchQueue.global(qos: .userInitiated).sync {
            // MARK: - Get data
            self.categoryNewsArray = dataServise.getEvents(currentCategoryId: currentCategoryId)
        }
        presenter?.presentData(data: categoryNewsArray, currentCategoryTitle: currentCategoryTitle)
    }
    
    
}
