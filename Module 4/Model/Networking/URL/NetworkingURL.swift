//
//  Networking.swift
//  Module 4
//
//  Created by Влад Бокин on 20.09.2022.
//

import Foundation

class NetworkingURLManager {
    
    func stringToURL(urlString: String) -> URL? {
        let url: URL = URL(string: urlString)!
            return url
    }
}

enum URLString: String {
    
    case categoryURL = "https://6329cdf14c626ff832caf8ad.mockapi.io/CategotyData"
    
    case eventURL = "https://6329cdf14c626ff832caf8ad.mockapi.io/eventData"
}




