//
//  EventsRouter.swift
//  Module 4
//
//  Created by Влад Бокин on 04.10.2022.
//

import Foundation
import SwiftUI

protocol EventsRoutingLogic: AnyObject {
    func navigateToDetailEvent(currentEventDetail: EventsEnum.ViewDidLoad.EventModelElement)
}

protocol EventsDetailDataPassing {
    var dataStore: EventsDataStore? { get }
}

final class EventsRouter: EventsDetailDataPassing {

  weak var viewController: EventsController?
  var dataStore: EventsDataStore?

}

extension EventsRouter: EventsRoutingLogic {
    func navigateToDetailEvent(currentEventDetail: EventsEnum.ViewDidLoad.EventModelElement) {
        let detailEventVC = EventDetailsController()
        var eventActionButton: [EventDetailEnum.ViewDidLoad.EventActionButton] = []
        
        currentEventDetail.actionButtons?.forEach({ button in
            eventActionButton.append(EventDetailEnum.ViewDidLoad.EventActionButton(buttonTitle: button.buttonTitle, buttonID: button.buttonID) )
        })
        let currentEventDetail: EventDetailEnum.ViewDidLoad.EventModelElement? = EventDetailEnum.ViewDidLoad.EventModelElement(id: currentEventDetail.id, category: currentEventDetail.category, images: currentEventDetail.images, title: currentEventDetail.title, subTitle: currentEventDetail.subTitle, timeout: currentEventDetail.timeout, fond: currentEventDetail.fond, adress: currentEventDetail.adress, phones: currentEventDetail.phones, infoText: currentEventDetail.infoText, actionButtons: eventActionButton)
        
        detailEventVC.router?.dataStore?.currentEventDetail = currentEventDetail
        
        viewController?.navigationController?.pushViewController(detailEventVC, animated: true)
    }
    
    
}
