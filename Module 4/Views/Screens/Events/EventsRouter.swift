//
//  EventsRouter.swift
//  Module 4
//
//  Created by Влад Бокин on 04.10.2022.
//

import Foundation

protocol EventsRoutingLogic: AnyObject {
    func navigateToDetailEvent(currentEventDetail: EventModelElement)
}

protocol EventsDataPassing {
    var dataStore: EventsDataStore? { get }
}

final class EventsRouter: EventsDataPassing {

  weak var viewController: EventsController?
  var dataStore: EventsDataStore?

}

extension EventsRouter: EventsRoutingLogic {
    func navigateToDetailEvent(currentEventDetail: EventModelElement) {
        let detailEventVC = EventDetailsController()

        detailEventVC.router?.dataStore?.currentEventDetail = currentEventDetail
        viewController?.navigationController?.pushViewController(detailEventVC, animated: true)
    }
    
    
}
