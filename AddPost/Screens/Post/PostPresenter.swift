//
//  PostController.swift
//  AddPost
//
//  Created by Vladislav on 15.01.2022.
//

import Foundation
import UIKit
// Presenter class for our viewController
class PostPresenter: NSObject {
    // giving PostViewController to class
    weak var postViewController: PostViewController?
    // Assigning Data Provider
    private let dataProvider = PostDataProvider()
    // Initializing PostDataSource in our controller
    private lazy var dataSource = PostDataSource(dataProvider: dataProvider)
    // Initializing post interactor
    private lazy var postInteractor = PostInteractor(dataProvider: dataProvider)
    // giving access to PostViewController
    init(postViewController: PostViewController) {
        self.postViewController = postViewController
    }
    // creating var to manipulate tableview within this class
    var postsTableView: UITableView? {
        return postViewController?.postsTableView
    }
    
    // registering cell from Xib
    private let cellId = "PostCell"
    func registerCell() {
        let cellXib = UINib(nibName: cellId, bundle: .main)
        postsTableView!.register(cellXib, forCellReuseIdentifier: cellId)
    }
    
    // assigning delegate and datasource of tableview
    func delegating() {
        postsTableView?.delegate = self
        postsTableView?.dataSource = dataSource
    }
    // action for Plus Button
    func plusButtonAction() {
        let nextVC = AddPostViewController()
        postViewController?.navigationController?.pushViewController(nextVC, animated: true)
    }
    // method to get data from server and keep it updated
    func viewDidLoad() {
        delegating()
        registerCell()
        postInteractor.listenUpdates()
        // applying delegate we created in postdata provider
        dataProvider.delegate = self
        postsTableView?.rowHeight = 120
    }
}

// extension to reload tableview data correctly
// using delegate we created and defining actual functionality
extension PostPresenter: PostDataProviderDelegate {
    func dataUpdated() {
        postsTableView?.reloadData()
    }
}

extension PostPresenter: UITableViewDelegate {
    
}
