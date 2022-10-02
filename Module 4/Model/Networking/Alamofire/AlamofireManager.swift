//
//  NetworkService.swift
//  Module 4
//
//  Created by Влад Бокин on 21.09.2022.
//

import Foundation
import Alamofire

enum ObtainCategoryResult {
    case success(CategoriesModel)
    case failure(Error)
}

enum ObtainEventResult {
    case success(EventModel)
    case failure(Error)
}

class AlamofireManager {
    
    class func requestCategoryData(_ Url: URL, completion: @escaping (ObtainCategoryResult) -> Void) {
        AF.request(Url).responseDecodable(of: CategoriesModel.self) { responseJson in
            switch responseJson.result {
            case .success(let json):
                completion(.success(json))
                print(completion(.success(json)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    class func requestEventData(_ Url: URL, completion: @escaping (ObtainEventResult) -> Void) {
        AF.request(Url).responseDecodable(of: EventModel.self) { responseJson in
            switch responseJson.result {
            case .success(let json):
                completion(.success(json))
                print(completion(.success(json)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
