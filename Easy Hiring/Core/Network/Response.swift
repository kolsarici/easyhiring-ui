//
//  Response.swift
//  Easy Hiring
//
//  Created by Ahmet Bilal KOLSARICI on 9.11.2022.
//

struct Response<T: Decodable>: Decodable {
    let success: Bool?
    let messageCode: String?
    let message: String?
    let userMessage: String?
    let data: T?
}
