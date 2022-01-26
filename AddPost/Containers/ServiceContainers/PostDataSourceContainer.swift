//
//  PostDataSourceContainer.swift
//  AddPost
//
//  Created by Vladislav on 22.01.2022.
//

import Swinject

class PostDataSourceContainer: Containerable {
    let mainContainer: MainContainer
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    // Registering PostDataSource
    func register() {
        rootContainer.register(PostDataSource.self) { (r) -> PostDataSource in
            return PostDataSource(dataProvider: r.resolve(PostDataProvidable.self)!)
        }
    }
}

