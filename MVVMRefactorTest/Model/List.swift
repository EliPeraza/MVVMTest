//
//  List.swift
//  MVC simple test
//
//  Created by Elizabeth Peraza-Munoz on 12/28/19.
//  Copyright © 2019 Elizabeth Peraza-Munoz. All rights reserved.
//

import Foundation

struct List: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
