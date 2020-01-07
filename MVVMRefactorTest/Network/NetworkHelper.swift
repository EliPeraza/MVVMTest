//
//  NetworkHelper.swift
//  MVC simple test
//
//  Created by Elizabeth Peraza-Munoz on 12/28/19.
//  Copyright © 2019 Elizabeth Peraza-Munoz. All rights reserved.
//

import Foundation

final class NetworkHelper {
    private init() {}
    static let shared = NetworkHelper()
    func performDataTask(endpointURLString: String,
                         httpMethod: String,
                         httpBody: Data?,
                         handler: @escaping (AppError?, Data?) -> Void) {
        guard let url = URL(string: endpointURLString) else {
            handler(AppError.badURL(endpointURLString), nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.httpBody = httpBody
        let task = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if let error = error {
                handler(AppError.networkingError(error), nil)
            }
            guard let httpResponse = urlResponse as? HTTPURLResponse,
                (200...209).contains(httpResponse.statusCode) else {
                    let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode ?? -999
                    handler(AppError.badStatusCode(String(statusCode)), nil)
                    return
            }
            if let data = data {
                handler(nil, data)
            }
        }
        task.resume()
    }
}
