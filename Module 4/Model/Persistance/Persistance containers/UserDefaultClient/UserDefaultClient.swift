//
//  UserDefaultClient.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

final class UserDefaultClient {
    
    enum userDefaultKeys: String {
        case flagCategoryDataContained = "flagCategoryDataContained"
        case flagEventDataContained = "flagEventDataContained"
        
    }
    
    // MARK: - If category data saved in persistanse this flag is true
    public func storeFlagHasCategoryData(isContain: Bool) {
        UserDefaults.standard.set(isContain, forKey: userDefaultKeys.flagCategoryDataContained.rawValue)
    }
    
    public func storeFlagHasEventData(isContain: Bool) {
        UserDefaults.standard.set(isContain, forKey: userDefaultKeys.flagEventDataContained.rawValue)
    }
    
    // MARK: - Read data
    public func retrieveFlagHasCategoryData() -> Bool {
        UserDefaults.standard.bool(forKey: userDefaultKeys.flagCategoryDataContained.rawValue)
    }
    
    // MARK: - Read data
    public func retrieveFlagHasEventData() -> Bool {
        UserDefaults.standard.bool(forKey: userDefaultKeys.flagEventDataContained.rawValue)
    }
}
