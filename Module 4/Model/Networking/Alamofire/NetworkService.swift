//
//  NetworkService.swift
//  Module 4
//
//  Created by Влад Бокин on 21.09.2022.
//

import Foundation
import Alamofire

enum ObtainResult {
    case success(CategoriesModel)
    case failure(Error)
}

class MyNetworkService {
    
    class func fetchData(_ Url: URL, completion: @escaping (ObtainResult) -> Void) {
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
    
   
}
