//
//  eventModel.swift
//  Module 4
//
//  Created by Влад Бокин on 29.08.2022.
//

import Foundation

// MARK: - EventElement
struct EventModelElement: Codable {
    let id: String?
    let category, images: [String]?
    let title, subTitle, timeout, fond: String?
    let adress, phones, infoText: String?
}

typealias EventModel = [EventModelElement]
