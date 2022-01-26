//
//  PostRouter.swift
//  AddPost
//
//  Created by Vladislav on 24.01.2022.
//

import UIKit

// Another router class. This one will be used to push to nextVC with help of navigation controller that we initialized earlier in RootRouter
class AddPostRouter {
    
    private let mainContainer: MainContainer
    
    init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    // method to push view controller. It takes argument of current view controller and pushes to next one. we'll call this method in PostPresenter
    func pushToAddPost(from vc: PostViewController?) {
        let nextVC = mainContainer.rootContainer.resolve(AddPostViewController.self)
        vc?.navigationController?.pushViewController((nextVC)!, animated: true)
    }
}
