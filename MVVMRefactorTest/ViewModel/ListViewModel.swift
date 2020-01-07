//
//  ListViewModel.swift
//  MVVMRefactorTest
//
//  Created by Elizabeth Peraza-Munoz on 12/28/19.
//  Copyright © 2019 Elizabeth Peraza-Munoz. All rights reserved.
//

import Foundation

struct ListViewModel {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    init(listPlaceholderText: List) {
        self.userId = listPlaceholderText.userId
        self.id = listPlaceholderText.id
        self.title = listPlaceholderText.title
        self.body = listPlaceholderText.body
    }
    
    public func setUserIDField(IDFromUser: Int) -> String {
        return "User ID \(IDFromUser)"
    }
    
    public func setPostIF(postID: Int) -> String {
        return "Post ID \(postID)"
    }
    
}
