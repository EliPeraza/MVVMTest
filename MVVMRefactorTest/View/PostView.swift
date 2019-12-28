//
//  PostView.swift
//  MVVMRefactorTest
//
//  Created by Elizabeth Peraza-Munoz on 12/28/19.
//  Copyright © 2019 Elizabeth Peraza-Munoz. All rights reserved.
//

import UIKit
import  SnapKit

class PostView: UIView {
    
    lazy var postTableView: UITableView = {
       let tableView = UITableView()
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public func commonInit() {
        postTableView.register(PostCell.self, forCellReuseIdentifier: "PostCellIdentify")
        setUpConstraints()
    }
    
}

extension PostView {
    private func setUpConstraints() {
        tableConstraints()
    }
    
    private func tableConstraints() {
        addSubview(postTableView)
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        postTableView.snp.makeConstraints { (make) in
            make.top.equalTo(0.0)
            make.bottom.equalTo(0.0)
            make.trailing.equalTo(0.0)
            make.leading.equalTo(0.0)
        }
    }
    
}
