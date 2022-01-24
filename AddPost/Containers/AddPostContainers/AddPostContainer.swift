//
//  AddPostContainer.swift
//  AddPost
//
//  Created by Vladislav on 21.01.2022.
//

import Swinject

import Foundation
import Swinject
// This Class will register Post - ViewController, Presenter, Interactor
class AddPostContainer: Containerable {
    // Creating reference to MainContainer
    let mainContainer: MainContainer
    // creating required init and function from Containerable protocol
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    func register() {
        rootContainer.register(AddPostViewController.self) { (r) -> AddPostViewController in
            return AddPostAssembly(fireStoreService: r.resolve(FirestoreService.self)!,
                                   fireStorageService: r.resolve(FireStorageService.self)!)
                .assembly()!
        }.inObjectScope(.container)
    }
}
