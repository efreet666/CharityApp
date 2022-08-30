//
//  eventModel.swift
//  Module 4
//
//  Created by Влад Бокин on 29.08.2022.
//

import Foundation

// MARK: - EventElement
struct EventModel: Codable {
    let id: String?
    let category: [String]?
    let title, subTitle, timeout, fond: String?
    let adress, phones, infoText: String?
}

typealias Event = [EventModel]
