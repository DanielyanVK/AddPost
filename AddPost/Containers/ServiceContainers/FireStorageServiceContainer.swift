//
//  FireStorageServiceContainer.swift
//  AddPost
//
//  Created by Vladislav on 23.01.2022.
//

import Swinject

class FireStorageServiceContainer: Containerable {
    let mainContainer: MainContainer
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    // Registering StorageServiceImplementation with FireStorageService protocol
    func register() {
        rootContainer.register(FireStorageService.self) { (r) -> FireStorageService in
            return StorageServiceImplementation()
        }
    }
}

