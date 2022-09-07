//
//  Category+CoreDataProperties.swift
//  
//
//  Created by Влад Бокин on 07.09.2022.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var image: String?

}
