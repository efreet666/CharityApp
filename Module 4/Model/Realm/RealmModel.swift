//
//  RealmModel.swift
//  Module 4
//
//  Created by Влад Бокин on 18.09.2022.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var image = ""
}

class Events: Object {
    @objc dynamic var id = ""
    var category = List<String>()
    var images = List<String>()
    @objc dynamic var title = ""
    @objc dynamic var subTitle = ""
    @objc dynamic var timeout = ""
    @objc dynamic var fond = ""
    @objc dynamic var adress = ""
    @objc dynamic var phones = ""
    @objc dynamic var infoText = ""
    let actionButtons = List<ActionButtons>()
}

class ActionButtons: Object {
    @objc dynamic var buttonTitle = ""
    @objc dynamic var buttonID = ""
}

