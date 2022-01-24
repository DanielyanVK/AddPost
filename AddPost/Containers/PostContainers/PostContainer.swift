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
    // I will write down the connections between elements for future reference:
    // View (ViewController) knows about Presenter
    // Presenter knows about View and Interactor
    // Interactor doesn't know either. Knows about dataprovider and FireStoreSeviceImplementation
    func register() {
        // Connection between ViewController and Presenter
        rootContainer.register(PostViewController.self) { (r) -> PostViewController in
            return PostAssembly(firestoreService: r.resolve(FirestoreService.self)!,
                                postDataProvidable: r.resolve(PostDataProvidable.self)!, mainContainer: self.mainContainer,
                                postRoutable: r.resolve(PostRoutable.self)!)
                .assembly()!
        }.inObjectScope(.container)
    }
}
