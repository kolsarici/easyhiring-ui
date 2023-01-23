//
//  TDError.swift
//  Easy Hiring
//
//  Created by Ahmet Bilal KOLSARICI on 9.11.2022.
//

import Foundation

public enum TDError: Error {

    case unknown
    case responseNull
    case invalidRequest
    case genericErrror(message: String)
    case bussinnesError(message: String, code: String)
    case invalidEncode(message: String)
    case networkError(message: String)
    case externalRegisterError
    case encodingError(message: String)
    case externalLoginError(message: String)
    case unauthorized

    var localizedDescription: String {
        switch self {
        case .responseNull:
            return "responeNull"
        case .unknown:
            return "unknown"
        case .genericErrror(let message):
            return message
        case .invalidRequest:
            return "invalidRequsest"
        case .bussinnesError(let message, let code):
            return String("\(message)-\(code)")
        case .invalidEncode(let message):
            return message
        case .networkError(let message):
            return message
        case .externalRegisterError:
            return "externalRegisterError"
        case .encodingError(let message):
            return message
        case .externalLoginError(let message):
            return message
        case .unauthorized:
            return "Beklenemeyn bir hata olustu"
        }
    }

    public var message: String {
        switch self {
        case .unknown:
            return "responeNull"
        case .responseNull:
            return "responeNull"
        case .genericErrror(let message):
            return message
        case .invalidRequest:
            return "invalidRequsest"
        case .bussinnesError(let message, let code):
            return String("\(message)\n\(code)")
        case .invalidEncode(let message):
            return message
        case .networkError(let message):
            return message
        case .externalRegisterError:
            return "externalRegisterError"
        case .externalLoginError(let message):
            return message
        case .encodingError(let message):
            return message
        case .unauthorized:
            return "Beklenemeyn bir hata olustu"
        }
    }

    var code: Int {
        switch self {
        case .unknown:
            return 0
        case .responseNull:
            return 0
        case .genericErrror:
            return 0
        case .invalidRequest:
            return 0
        case .bussinnesError:
            return 0
        case .invalidEncode:
            return 0
        case .networkError:
            return 0
        case .externalLoginError:
            return 0
        case .externalRegisterError:
            return 0
        case .encodingError:
            return 0
        case .unauthorized:
            return 0
        }
    }
}

extension TDError: Equatable {

    public static func == (lhs: TDError, rhs: TDError) -> Bool {
        switch (lhs, rhs) {
        case ((.responseNull), (.responseNull)):
            return true
        case ((.genericErrror), (.genericErrror)):
            return true
        case ((.invalidRequest), (.invalidRequest)):
            return true
        case ((.bussinnesError), (.bussinnesError)):
            return true
        case ((.invalidEncode), (.invalidEncode)):
            return true
        case ((.networkError), (.networkError)):
            return true
        case ((.externalLoginError), (.externalLoginError)):
            return true
        case ((.externalRegisterError), (.externalRegisterError)):
            return true
        case ((.encodingError), (.encodingError)):
            return true
        case ((.unauthorized), (.unauthorized)):
            return true
        default:
            return false
        }
    }
}
