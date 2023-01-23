//
//  Services.swift
//  Easy Hiring
//
//  Created by Ahmet Bilal KOLSARICI on 8.11.2022.
//

import Foundation

public struct Service {
    public static let baseUrl = "http://localhost:82/"
    
    public struct Question {
        private static let base = "\(Service.baseUrl)question/"
        public static let get = "\(base)"
    }
}
