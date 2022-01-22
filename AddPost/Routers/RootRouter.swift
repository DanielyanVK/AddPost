//
//  RootRouter.swift
//  AddPost
//
//  Created by Vladislav on 21.01.2022.
//

import UIKit

class RootRouter {
    private let mainContainer: MainContainer
    
    init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func root(_ window: UIWindow?, scene: UIWindowScene) {
        let vc = mainContainer.rootContainer.resolve(PostViewController.self)
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
}
