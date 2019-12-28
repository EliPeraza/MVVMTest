//
//  ListPostController.swift
//  MVVMRefactorTest
//
//  Created by Elizabeth Peraza-Munoz on 12/28/19.
//  Copyright © 2019 Elizabeth Peraza-Munoz. All rights reserved.
//

import UIKit

class ListPostController: UIViewController {
    let postView = PostView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        self.view.addSubview(postView)
        self.postView.postTableView.delegate = self
        self.postView.postTableView.dataSource = self
    }
}

extension ListPostController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.postView.postTableView.dequeueReusableCell(withIdentifier: "PostCellIdentify", for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        cell.body.text = "dddd"
        cell.postID.text = "1"
        cell.userIDLabel.text = "2"
        cell.title.text = "sss"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
