//
//  SaveEmailViewModel.swift
//  Easy Hiring
//
//  Created by Ahmet Bilal KOLSARICI on 31.10.2022.
//

import Foundation

class SaveEmailViewModel: ObservableObject {
    let placeholder = "E-mail"
    @Published var email = ""
}
