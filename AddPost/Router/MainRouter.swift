//
//  MainRouter.swift
//  AddPost
//
//  Created by Vladislav on 21.01.2022.
//

import UIKit

class MainRouter {
    var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    func root(_ window: inout UIWindow?) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = viewController
    }
}
