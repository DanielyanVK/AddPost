//
//  ContainersController.swift
//  AddPost
//
//  Created by Vladislav on 21.01.2022.
//

import Swinject
// Here we setup containers. We should mention all containers in setup method.
class ContainersController {
    
    private let mainContainer: MainContainer
    
    internal init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    // Gatherig all containers in one place and register them through mainContainer's method
    func setup() {
        let containers: [Containerable] = [
            PostContainer(mainContainer: mainContainer),
            PostDataProviderContainer(mainContainer: mainContainer),
            FireStoreServiceContainer(mainContainer: mainContainer),
            PostDataSourceContainer(mainContainer: mainContainer),
            FireStorageServiceContainer(mainContainer: mainContainer),
            AddPostContainer(mainContainer: mainContainer),
            AddPostRouterContainer(mainContainer: mainContainer)
        ]
        mainContainer.register(containers: containers)
        
    }
}
