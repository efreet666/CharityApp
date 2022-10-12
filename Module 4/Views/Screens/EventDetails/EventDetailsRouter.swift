//
//  EventDetailsRouter.swift
//  Module 4
//
//  Created by Влад Бокин on 04.10.2022.
//

import Foundation

protocol EventDetailsRoutingLogic: AnyObject {

}

protocol EventDetailsDataPassing: AnyObject {
  var dataStore: EventDetailsDataStore? { get }
}

final class EventDetailsRouter: EventDetailsRoutingLogic, EventDetailsDataPassing {

  weak var viewController: EventDetailsController?
  var dataStore: EventDetailsDataStore?

}
