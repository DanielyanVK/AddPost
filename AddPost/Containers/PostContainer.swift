//
//  PostContainer.swift
//  AddPost
//
//  Created by Vladislav on 21.01.2022.
//

import Foundation
import Swinject
// This Class will register Post - ViewController, Presenter, Interactor
class PostContainer: Containerable {
    // Creating reference to MainContainer
    let mainContainer: MainContainer
    // creating required init and function from Containerable protocol
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    // when we want to register something we call rootController reference we provided in extension for Containerable
    func register() {
//        rootContainer.register(<#T##serviceType: Service.Type##Service.Type#>, name: <#T##String?#>, factory: <#T##(Resolver) -> Service#>)
        
    }
}
