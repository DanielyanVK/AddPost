//
//  ContainersController.swift
//  AddPost
//
//  Created by Vladislav on 21.01.2022.
//

import Swinject
// here we setup containers. We should mention all containers in setup method.
class ContainersController {
    
    private let mainContainer: MainContainer
    
    internal init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    
    func setup() {
        let containers: [Containerable] = [
            PostContainer(mainContainer: mainContainer),
            PostDataProviderContainer(mainContainer: mainContainer),
            FireStoreServiceContainer(mainContainer: mainContainer),
            PostDataSourceContainer(mainContainer: mainContainer),
            FireStorageServiceContainer(mainContainer: mainContainer),
            AddPostContainer(mainContainer: mainContainer),
            PostRouterContainer(mainContainer: mainContainer)
        ]
        mainContainer.register(containers: containers)
        
    }
}
