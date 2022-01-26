//
//  RouterContainer.swift
//  AddPost
//
//  Created by Vladislav on 24.01.2022.


import Swinject

class AddPostRouterContainer: Containerable {
    
    let mainContainer: MainContainer
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    // Registering AddPostRouter
    func register() {
        rootContainer.register(AddPostRouter.self) { (r) -> AddPostRouter in
            return AddPostRouter(mainContainer: self.mainContainer)
        }
    }
}
