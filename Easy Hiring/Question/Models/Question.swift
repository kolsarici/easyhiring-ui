//
//  Question.swift
//  Easy Hiring
//
//  Created by Ahmet Bilal KOLSARICI on 14.11.2022.
//

import Foundation

struct Question: Decodable {
    let text: String
    let options: [Option]
}
