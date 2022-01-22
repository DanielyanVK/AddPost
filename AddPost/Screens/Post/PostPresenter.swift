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
    weak var view: PostViewController?
    // Assigning Data Provider
    var dataProvider: PostDataProvidable?
    // Initializing PostDataSource in our controller
    var dataSource: PostDataSource?
    // Initializing post interactor
    var interactor: PostInteractor?
    
    // creating var to manipulate tableview within this class
    var postsTableView: UITableView? {
        return view?.postsTableView
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
        view?.navigationController?.pushViewController(nextVC, animated: true)
    }
    // method to get data from server and keep it updated
    func viewDidLoad() {
        delegating()
        registerCell()
        interactor?.listenUpdates()
        // applying delegate we created in postdata provider
        dataProvider?.delegate = self
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
