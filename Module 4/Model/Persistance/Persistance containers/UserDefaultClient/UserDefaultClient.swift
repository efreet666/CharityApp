//
//  UserDefaultClient.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

final class UserDefaultClient {
    
    enum userDefaultKeys: String {
        case flagDataContain = "flagDataContain"
    }
    
    // MARK: - If smth save in persistanse this flag is true
    static func storeFlagHasData(isContain: Bool) {
        UserDefaults.standard.set(isContain, forKey: userDefaultKeys.flagDataContain.rawValue)
    }
    
    // MARK: - Read data
    static func retrieveFlagHasData() -> Bool {
        UserDefaults.standard.bool(forKey: userDefaultKeys.flagDataContain.rawValue)
    }
}
