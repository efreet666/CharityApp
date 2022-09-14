//
//  ActionButton+CoreDataProperties.swift
//  Module 4
//
//  Created by Влад Бокин on 10.09.2022.
//
//

import Foundation
import CoreData


extension ActionButton {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ActionButton> {
        return NSFetchRequest<ActionButton>(entityName: "ActionButton")
    }

    @NSManaged public var buttonID: String?
    @NSManaged public var buttonTitle: String?
    @NSManaged public var contain: Event?

}

extension ActionButton : Identifiable {

}
