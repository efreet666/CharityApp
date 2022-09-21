//
//  ApiManager.swift
//  Module 4
//
//  Created by Влад Бокин on 21.09.2022.
//

import Foundation

// API Request Abstraction

public enum RequestType: String {
    case GET, POST
}

protocol APIRequest {
    var method: RequestType { get }
    var path: String { get }
    var parameters: [String : String] { get }
}

extension APIRequest {
    func request(with baseURL: URL) -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }
        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }
        guard let url = components.url else {
            fatalError("Could not get url")
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}


class Request: APIRequest {
    var method = RequestType.GET
    var path = ""
    var parameters = [String: String]()
    
    init(title: String) {
        parameters["t"] = title
        parameters["apiKey"] = ""
    }
}

///
/// API Client
///
enum APIError: Error {
    case SomeError
}

class APIClient {
    private let baseURL = URL(string: "https://6329cdf14c626ff832caf8ad.mockapi.io/CategotyData")!
    
    func send<T: Codable>(_ apiRequest: APIRequest, URL: URL, completion: @escaping (Result<T, APIError>) -> Void) {
        
        let request = apiRequest.request(with: URL)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.SomeError))
                return
            }
            guard let data = data else {
                completion(.failure(.SomeError))
                return
            }
            do {
                let model: T = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model))
            } catch {
                print(error)
                completion(.failure(.SomeError))
            }
        }
        task.resume()
    }
}
