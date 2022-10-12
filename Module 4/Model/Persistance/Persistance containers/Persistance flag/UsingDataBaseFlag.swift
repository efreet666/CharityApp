//
//  UsingDataBaseFlag.swift
//  Module 4
//
//  Created by Влад Бокин on 18.09.2022.
//

import Foundation

// MARK: - Choose DB for use
final class UsingDataBaseFlag {
    
    enum dataBases {
        case coreData
        case Realm
    }
    
    // MARK: - Flag
    public let flag: dataBases = .Realm
}
