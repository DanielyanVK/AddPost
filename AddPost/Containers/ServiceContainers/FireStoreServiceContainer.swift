//
//  FireStoreServiceContainer.swift
//  AddPost
//
//  Created by Vladislav on 21.01.2022.
//

import Swinject

class FireStoreServiceContainer: Containerable {
    let mainContainer: MainContainer
    required init(mainContainer: MainContainer) {
        self.mainContainer = mainContainer
    }
    // Registering FirestoreServiceImplementation with it's FirestoreService protocol
    func register() {
        rootContainer.register(FirestoreService.self) { (r) -> FirestoreService in
            return FirestoreServiceImplementation()
        }
    }
}
