//
//  UsingDataBaseFlag.swift
//  Module 4
//
//  Created by Влад Бокин on 18.09.2022.
//

import Foundation

class UsingDataBaseFlag {
    
    enum dataBases {
        case coreData
        case Realm
    }
    
    // MARK: - Flag
    static let flag: dataBases = .Realm
}
