//
//  PostRouter.swift
//  AddPost
//
//  Created by Vladislav on 24.01.2022.
//

import UIKit

protocol PostRoutable {
    func pushToAddPost()
}

class PostRouter: PostRoutable {
  
    private let mainContainer: MainContainer
    
    init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func pushToAddPost() {
        let homeVC = mainContainer.rootContainer.resolve(PostViewController.self)
        let nextVC = mainContainer.rootContainer.resolve(AddPostViewController.self)
        homeVC?.navigationController?.pushViewController((nextVC)!, animated: true)
    }
}
