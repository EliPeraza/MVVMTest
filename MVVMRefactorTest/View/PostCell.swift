//
//  PostCell.swift
//  MVVMRefactorTest
//
//  Created by Elizabeth Peraza-Munoz on 12/28/19.
//  Copyright © 2019 Elizabeth Peraza-Munoz. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    lazy var userIDLabel: UILabel = {
        let userIDLbl = UILabel()
        return userIDLbl
    }()
    
    lazy var postID: UILabel = {
        let postLbl = UILabel()
        return postLbl
    }()
    
    lazy var title: UILabel = {
        let titleLbl = UILabel()
        return titleLbl
    }()
    
    lazy var body: UITextView = {
        let bodyText = UITextView()
        return bodyText
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "PostCellIdentify")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        cellConstraintSetUp()
    }
}

extension PostCell {
    private func cellConstraintSetUp() {
        userIDLabelConstraint()
        postIDLabelConstraint()
        titleLableConstraint()
        bodyTextViewConstraint()
    }
    
    private func userIDLabelConstraint() {
        addSubview(userIDLabel)
        userIDLabel.translatesAutoresizingMaskIntoConstraints = false
        userIDLabel.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.trailing.equalTo(-0.20)
            make.width.equalTo(40)
            make.height.equalTo(21)
        }
    }
    
    private func postIDLabelConstraint() {
        addSubview(postID)
        postID.translatesAutoresizingMaskIntoConstraints = false
        postID.snp.makeConstraints { (make) in
            make.top.equalTo(userIDLabel.snp.bottom).offset(11)
            make.trailing.equalTo(-0.20)
            make.width.equalTo(40)
            make.height.equalTo(21)
        }
    }
    
    private func titleLableConstraint() {
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.snp.makeConstraints { (make) in
            make.top.equalTo(postID.snp.bottom).offset(11)
            make.height.equalTo(45)
            make.centerX.equalToSuperview()
        }

    }
    
    private func bodyTextViewConstraint() {
        addSubview(body)
        body.translatesAutoresizingMaskIntoConstraints = false
        body.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.20)
            make.height.equalTo(40)
        }

    }
}
