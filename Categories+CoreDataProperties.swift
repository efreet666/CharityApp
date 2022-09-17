//
//  Categories+CoreDataProperties.swift
//  Module 4
//
//  Created by Влад Бокин on 17.09.2022.
//
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }

    @NSManaged public var id: String?
    @NSManaged public var image: String?
    @NSManaged public var title: String?

}

extension Categories : Identifiable {

}
