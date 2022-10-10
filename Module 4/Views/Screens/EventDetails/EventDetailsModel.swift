//
//  EventDetailsModel.swift
//  Module 4
//
//  Created by Влад Бокин on 10.10.2022.
//

import Foundation

enum EventDetailEnum {
    
    enum ViewDidLoad {
        
        struct Request { }
        
//        struct Response {
//            var EventArray: [EventModelElement?]
//            var currentCategoryTitle = ""
//        }
//        
//        struct ViewModel {
//            var EventArray: [EventModelElement?]
//            var currentCategoryTitle = ""
//        }
        
        struct EventModelElement {
            let id: String?
            let category, images: [String]?
            let title, subTitle, timeout, fond: String?
            let adress, phones, infoText: String?
            let actionButtons: [EventActionButton]?
        }
        
        // MARK: - ActionButton
        struct EventActionButton {
            let buttonTitle, buttonID: String?
        }
    }
}
