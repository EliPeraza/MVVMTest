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
    
    public func populateCell(listModelView: ListViewModel) {
        self.body.text = listModelView.body
        self.postID.text = listModelView.setPostIF(postID: listModelView.id)
        self.title.text = listModelView.title
        self.userIDLabel.text = listModelView.setUserIDField(IDFromUser: listModelView.userId)
    }
    
    public func formatCell(cell: PostCell) {
        cell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelSetUp(labels: [cell.postID, cell.title, cell.userIDLabel])
        textViewSetUp(textView: cell.body)
    }
    
    private func labelSetUp(labels: [UILabel]) {
        for each in labels {
            if each == title {
                each.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                each.font = UIFont(name: "Thonburi", size: 14)
                each.numberOfLines = 0
                each.textAlignment = .center
            } else {
                each.font = UIFont(name: "Thonburi", size: 10)
                each.textColor = #colorLiteral(red: 0.5563425422, green: 0.9793455005, blue: 0, alpha: 1)
            }
        }
    }
    
    private func textViewSetUp(textView: UITextView) {
        textView.backgroundColor = .black
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textView.font = UIFont(name: "Thonburi", size: 12)
        textView.textAlignment = .center
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
            make.leading.equalTo(30)
            make.width.equalTo(80)
            make.height.equalTo(21)
        }
    }
    
    private func postIDLabelConstraint() {
        addSubview(postID)
        postID.translatesAutoresizingMaskIntoConstraints = false
        postID.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.trailing.equalTo(-0.30)
            make.width.equalTo(80)
            make.height.equalTo(21)
        }
    }
    
    private func titleLableConstraint() {
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.snp.makeConstraints { (make) in
            make.top.equalTo(postID.snp.bottom).offset(11)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.65)
        }
        
    }
    
    private func bodyTextViewConstraint() {
        addSubview(body)
        body.translatesAutoresizingMaskIntoConstraints = false
        body.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.leading.equalTo(11)
            make.height.equalTo(60)
        }
        
    }
}
