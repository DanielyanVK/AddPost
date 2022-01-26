//
//  RootRouter.swift
//  AddPost
//
//  Created by Vladislav on 21.01.2022.
//

import UIKit
//Root Router class.
// Here we assign our root view controller through method we will call i  scenedelegate and initialize navigation controller.

class RootRouter {
    
    private let mainContainer: MainContainer
    
    init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func root(_ window: UIWindow?, scene: UIWindowScene) {
        guard let vc = mainContainer.rootContainer.resolve(PostViewController.self) else { return }
        window?.makeKeyAndVisible()
        // EXTREMELY IMPORTANT!
        // Initialize navigation controller here. It launches navigation stack with post view controller at the bottom. After that you can Push/Pop other screens with functions defined in other routers
        window?.rootViewController = UINavigationController(rootViewController: vc)
    }
}
