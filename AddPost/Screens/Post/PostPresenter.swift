//
//  PostController.swift
//  AddPost
//
//  Created by Vladislav on 15.01.2022.
//

import Foundation
import UIKit
// Presenter class for our ViewController
class PostPresenter: NSObject {
    // here we mention dependencies that we registered previously through containers and assembled through assembly
    // VERY IMPORTANT: do not let two elements point at each other with "var" it will crash your app. Instead youse "weak var" on one of the elements if they point at each other
    weak var view: PostViewController?
    var dataProvider: PostDataProvidable?
    var dataSource: PostDataSource?
    var interactor: PostInteractor?
    var router: AddPostRouter?
    
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
        router?.pushToAddPost(from: view)
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
