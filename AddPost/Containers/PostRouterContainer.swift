//
//  RouterContainer.swift
//  AddPost
//
//  Created by Vladislav on 24.01.2022.


import Swinject

class PostRouterContainer: Containerable {
    
    let mainContainer: MainContainer
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    // Registering FirestoreServiceImplementation with it's FirestoreService protocol
    func register() {
        rootContainer.register(PostRoutable.self) { (r) -> PostRoutable in
            return PostRouter(mainContainer: self.mainContainer)
        }
    }
}
