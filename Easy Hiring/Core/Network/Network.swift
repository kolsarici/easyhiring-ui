//
//  Network.swift
//  Easy Hiring
//
//  Created by Ahmet Bilal KOLSARICI on 9.11.2022.
//

import Foundation

public class Network {
    static let shared = Network()
    
    func request<T: Decodable>(request: Request, completion: @escaping(Result<T?, TDError>) -> Void) -> URLSessionDataTask? {
        
        guard let req = request.urlRequestBuilder() else {
            completion(.failure(.invalidRequest))
            return nil
        }
        
        let task = URLSession.shared.dataTask(with: req) { [weak self] (data, response, error) in
            
            
            
            guard let responseData = data else {
                completion(.failure(.responseNull))
                return
            }
            
            do {
                if let response = try JSONDecoder().decode(Response<T>?.self, from: responseData) {
                    if let error = self?.checkError(response: response) {
                        completion(.failure(error))
                    } else {
                        completion(.success(response.data))
                    }
                } else {
                    completion(.failure(.responseNull))
                }
            } catch {
                completion(.failure(.invalidEncode(message: "Encoding error")))
            }
        }
        task.resume()
        return task
        
    }
    
    private func checkError<T: Decodable>(response: Response<T>) -> TDError? {
        if response.success == false && response.data == nil {
            return TDError.bussinnesError(message: response.userMessage ?? "", code: response.messageCode ?? "")
        }
        return nil
    }
    
    private func checkResponse(_ response: URLResponse?) -> TDError? {
        if let httpUrlResponse = response as? HTTPURLResponse {
            if !(200...299).contains(httpUrlResponse.statusCode){
                return TDError.unauthorized
            }
            return TDError.unknown
        }
        return nil
    }
}
