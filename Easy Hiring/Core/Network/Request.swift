//
//  Request.swift
//  Easy Hiring
//
//  Created by Ahmet Bilal KOLSARICI on 9.11.2022.
//

import Foundation

class Request {
    let httpMethod: HTTPMethod
    var parameters: [String:Any]?
    let urlString: String
    var url: URL?
    let timeoutInterval: TimeInterval
    
    init(httpMethod: HTTPMethod,
         parameters: [String:Any]? = nil,
         url: String,
         timeoutInterval: TimeInterval = 60.0) {
        self.httpMethod = httpMethod
        self.parameters = parameters
        self.urlString = url
        self.timeoutInterval = timeoutInterval
    }
    
    public func urlRequestBuilder() -> URLRequest? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        self.url = url

        var urlRequest = URLRequest(url: self.url ?? url,
                                    cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: timeoutInterval)
        urlRequest.httpMethod = httpMethod.rawValue
        

        if let parameters = parameters {
            if let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
                urlRequest.httpBody = httpBody
            }
        }
        return urlRequest
    }
}
