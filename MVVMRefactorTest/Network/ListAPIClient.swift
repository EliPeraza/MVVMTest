//
//  ListAPIClient.swift
//  MVC simple test
//
//  Created by Elizabeth Peraza-Munoz on 12/28/19.
//  Copyright © 2019 Elizabeth Peraza-Munoz. All rights reserved.
//

import Foundation

final class ListAPIClient {
    static func getListData(completionHandler: @escaping (AppError?, [List]?) -> Void) {
        let url = Constants.url
        NetworkHelper.shared.performDataTask(endpointURLString: url, httpMethod: "GET", httpBody: nil) { (appError, placeholderList) in
            if let appErr = appError {
                completionHandler(appErr, nil)
            }
            if let data = placeholderList {
                do {
                    let listData = try JSONDecoder().decode([List]?.self, from: data)
                    completionHandler(nil, listData)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
