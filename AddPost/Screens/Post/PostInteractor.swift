//
//  PostInteractor.swift
//  AddPost
//
//  Created by Vladislav on 15.01.2022.
//

import Foundation
import FirebaseDatabase
import FirebaseFirestore

class PostInteractor {
    // getting access to DataProvider through protocol
    var dataProvider: PostDataProvidable?
    init(dataProvider: PostDataProvidable) {
        self.dataProvider = dataProvider
    }
    // getting reference for FirestoreService protocols hollow function and add functionality to it through firestoreserviceimplementation
    private let firestoreService: FirestoreService = FirestoreServiceImplementation()
    // getting listenUpdates method we defined in firestore implementation
    // using setposts function from dataprovider to assign value we got from server
    func listenUpdates() {
        firestoreService.listenUpdates { (posts) in
            self.dataProvider?.setPosts(posts: posts)
        }
    }
}
