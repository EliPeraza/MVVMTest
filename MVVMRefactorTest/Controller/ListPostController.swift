//
//  ListPostController.swift
//  MVVMRefactorTest
//
//  Created by Elizabeth Peraza-Munoz on 12/28/19.
//  Copyright © 2019 Elizabeth Peraza-Munoz. All rights reserved.
//

import UIKit
import Alamofire

class ListPostController: UIViewController {
    let postView = PostView()
    var posts = [List]() {
        didSet {
            DispatchQueue.main.async {
                self.postView.postTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getData()
    }
    
    func setupView() {
        self.view.addSubview(postView)
        self.postView.postTableView.delegate = self
        self.postView.postTableView.dataSource = self
    }
    
    func getData() {
        ListAPIClient.getListData { (appError, data) in
            if let error = appError {
                print(error)
            }
            if let successData = data {
                self.posts = successData
            }
        }
    }
}

extension ListPostController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.postView.postTableView.dequeueReusableCell(withIdentifier: "PostCellIdentify", for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        let currentPost = posts[indexPath.row]
        let viewModelThing = ListViewModel.init(listPlaceholderText: currentPost)
        cell.populateCell(listModelView: viewModelThing)
        cell.formatCell(cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
