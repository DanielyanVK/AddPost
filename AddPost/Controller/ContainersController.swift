//
//  ContainersController.swift
//  AddPost
//
//  Created by Vladislav on 21.01.2022.
//

import Swinject

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
            PostDataSourceContainer(mainContainer: mainContainer)
        ]
        mainContainer.register(containers: containers)
        
    }
}
