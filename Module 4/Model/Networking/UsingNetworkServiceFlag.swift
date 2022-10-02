//
//  UsingNetworkServiceFlag.swift
//  Module 4
//
//  Created by Влад Бокин on 21.09.2022.
//

import Foundation

// MARK: - Choose DB for use
final class UsingNetworkServiceFlag {
    
    enum NetworkServices {
        case URLSession
        case Alamofire
    }
    
    // MARK: - Flag
    static let flag: NetworkServices = .URLSession
}
