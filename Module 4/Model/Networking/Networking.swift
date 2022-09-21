//
//  Networking.swift
//  Module 4
//
//  Created by Влад Бокин on 20.09.2022.
//

import Foundation

class Networking {
    
    static let url = URL(string: "https://6329cdf14c626ff832caf8ad.mockapi.io/CategotyData")
    
//    enum RequestType: String {
//    case postRequest = "POST"
//    case getRequest = "GET"
//    }
//    
//    static func getMethod<T: Codable>(URL: URL?, model: T.Type, requestType: RequestType){
//        
//            guard let url = URL else {
//                print("Error: cannot create URL")
//                return
//            }
//        
//            // Create the url request
//            var request = URLRequest(url: url)
//            request.httpMethod = "GET"
//        
//        var resultData: T?
//        
//        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
//        URLSession.shared.dataTask(with: request) { data, response, error in
//                guard error == nil else {
//                    print("Error: error calling GET")
//                    print(error!)
//                    return
//                }
//                guard let data = data else {
//                    print("Error: Did not receive data")
//                    return
//                }
//                guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
//                    print("Error: HTTP request failed")
//                    return
//                }
//                
//                do {
//                    let parsedData = try JSONDecoder().decode(model.self, from: data)
//                    print(parsedData)
//                    resultData = parsedData
//                    //return resultData
//                } catch {
//                    print("Error: Trying to convert JSON data to string")
//                    return
//                }
//            semaphore.signal()
//            }.resume()
//            semaphore.wait()
//        //return Result.success(resultData)
//        }
}

