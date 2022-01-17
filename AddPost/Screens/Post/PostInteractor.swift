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
    // calling for singleton
    let firestore = FirestoreServiceImplementation.shared
    // getting access to DataProvider through protocil
    var dataProvider: PostDataProvidable?
    init(dataProvider: PostDataProvidable) {
        self.dataProvider = dataProvider
    }
    // getting listenUpdates method we defined in firestore implementation through singleton
    // using setposts function from dataprovider to assign value we got from server
    func listenUpdates() {
        firestore.listenUpdates { (posts) in
            self.dataProvider?.setPosts(posts: posts)
        }
    }
}
