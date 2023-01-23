//
//  ViewModel.swift
//  Easy Hiring
//
//  Created by Ahmet Bilal KOLSARICI on 15.11.2022.
//

import Foundation

public class ViewModel: NSObject {

    deinit {
        let type = Swift.type(of: self)
        //Log.debug("\(type) DEALLOCATED")
    }

    var errorHandler: ((_ error: TDError) -> Void)?
    var retryHandler: ((_ customMessage: String?) -> Void)?
    var updateUI: (() -> Void)?
}
