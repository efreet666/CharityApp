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
    
    private var eventData: EventModel = []
    private var EventModelArray: [EventsEnum.ViewDidLoad.EventModelElement] = []
  var presenter: EventsPresentationLogic?

}

extension EventsInteractor: EventsBusinessLogic {
    func fetchEvents() {
        DispatchQueue.global(qos: .userInitiated).sync {
            // MARK: - Get data
            self.eventData = dataServise.getEvents(currentCategoryId: currentCategoryId)
            self.eventData.forEach { el in
                var actionButtons: [EventsEnum.ViewDidLoad.EventActionButton] = []
                el.actionButtons?.forEach({ button in
                    actionButtons.append(EventsEnum.ViewDidLoad.EventActionButton(buttonTitle: button.buttonTitle, buttonID: button.buttonID) )
                })
                let eventElement = EventsEnum.ViewDidLoad.EventModelElement(id: el.id, category: el.category, images: el.images, title: el.title, subTitle: el.subTitle, timeout: el.timeout, fond: el.fond, adress: el.adress, phones: el.phones, infoText: el.infoText, actionButtons: actionButtons)
                EventModelArray.append(eventElement)
            }
            
        }
        presenter?.presentData(data: EventsEnum.ViewDidLoad.Response(EventArray: EventModelArray, currentCategoryTitle: currentCategoryTitle))
    }
    
    
}
