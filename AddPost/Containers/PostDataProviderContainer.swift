//
//  PostDataProviderContainer.swift
//  AddPost
//
//  Created by Vladislav on 21.01.2022.
//

import Swinject

class PostDataProviderContainer: Containerable {
    let mainContainer: MainContainer
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    //  EXTREMELY IMPORTANT!
    //  It' the example of how to register classes that are covered with protocols
    // in rootContainer.register we use Protocol's name and in resolver as well
    // after that we return CLASS that conforms to that protocol
    func register() {
        // registering PostDataProvidable protocol
        rootContainer.register(PostDataProvidable.self) { (r) -> PostDataProvidable in
            return PostDataProvider()
        }
    }
}
