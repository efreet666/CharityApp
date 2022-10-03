//
//  URLSessionClient.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

final class URLSessionClient {
    
    private let networkingURL = NetworkingURL()
    
    public func fetchCategoryData() -> CategoriesModel {
        
        var categoryData: CategoriesModel?
        
        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
        let categoryRequest = Request(title: "")
        
        URLSessionManager().send(categoryRequest, URL: networkingURL.categoryURL) { (result: Result<CategoriesModel, APIError>) -> Void in
            switch result {
            case .success(let data):
                print(data)
                categoryData = data
            case .failure(let error):
                print(error)
            }
            semaphore.signal()
        }
        semaphore.wait()
        
        return categoryData ?? CategoriesModel()
        
    }
    
    public func fetchEventData() -> EventModel {
        var eventData: EventModel?
        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
        
            let categoryRequest = Request(title: "")
            URLSessionManager().send(categoryRequest, URL: networkingURL.eventURL) { (result: Result<EventModel, APIError>) -> Void in
                switch result {
                case .success(let data):
                    print(data)
                    eventData = data
                case .failure(let error):
                    print(error)
                }
                semaphore.signal()
            }
            semaphore.wait()
        
        return eventData ?? EventModel()
    }
}
