//
//  PostDataProvider.swift
//  AddPost
//
//  Created by Vladislav on 15.01.2022.
//

import Foundation

// protocol to set up table view
protocol PostDataProvidable {
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func setPosts(posts: [PostModel])
    func getPost(by indexPath: IndexPath) -> PostModel
    var delegate: PostDataProviderDelegate? {get set}
}
// creates delegate to use to refresh data
protocol PostDataProviderDelegate: AnyObject {
    func dataUpdated()
}

class PostDataProvider: PostDataProvidable {
    
    typealias Model = PostModel
    private var models: [PostModel] = []
    // creating delegate for postdata provider and applying it in postController
    weak var delegate: PostDataProviderDelegate?
    
    // Applying protocol functions
    func setPosts(posts: [PostModel]) {
        self.models = posts
    // very important to use here to refresh table view
    // the call itself is hollow now but we define it later in postController via extension
        delegate?.dataUpdated()
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        models.count
    }
    
    func getPost(by indexPath: IndexPath) -> PostModel {
        return models[indexPath.row]
    }
}
