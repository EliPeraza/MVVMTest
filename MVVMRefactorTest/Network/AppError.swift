//
//  AppError.swift
//  MVC simple test
//
//  Created by Elizabeth Peraza-Munoz on 12/28/19.
//  Copyright © 2019 Elizabeth Peraza-Munoz. All rights reserved.
//

import Foundation

enum AppError: Error {
    case badURL(String)
    case jsonDecodingError(Error)
    case networkingError(Error)
    case badStatusCode(String)
    
    public func errorMessage() -> String {
        switch self {
        case .badURL(let message):
            return "bad url: \(message)"
        case .jsonDecodingError(let error):
            return "json decoding error \(error)"
        case .networkingError(let error):
            return "networking error \(error)"
        case .badStatusCode(let message):
            return "bad status code: \(message)"
        }
    }
}
