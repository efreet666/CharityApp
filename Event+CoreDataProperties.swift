//
//  Event+CoreDataProperties.swift
//  
//
//  Created by Влад Бокин on 07.09.2022.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var subTitle: String?
    @NSManaged public var timeout: String?
    @NSManaged public var fond: String?
    @NSManaged public var infoText: String?
    @NSManaged public var phones: String?
    @NSManaged public var adress: String?
    @NSManaged public var category: [String]?
    @NSManaged public var images: [String]?
    @NSManaged public var actionButtons: NSObject?
    @NSManaged public var have: NSSet?

}

// MARK: Generated accessors for have
extension Event {

    @objc(addHaveObject:)
    @NSManaged public func addToHave(_ value: ActionButton)

    @objc(removeHaveObject:)
    @NSManaged public func removeFromHave(_ value: ActionButton)

    @objc(addHave:)
    @NSManaged public func addToHave(_ values: NSSet)

    @objc(removeHave:)
    @NSManaged public func removeFromHave(_ values: NSSet)

}
