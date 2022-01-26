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
    
    // getting access to DataProvider with it's protocol's implementation through init
    private let dataProvider: PostDataProvidable?
    init(dataProvider: PostDataProvidable?) {
        self.dataProvider = dataProvider
    }
    
    // referencing firestore service with it's implementation that we've registered in FireStoreServiceContainer
    var firestoreService: FirestoreService?
    // getting listenUpdates method we defined in firestore implementation
    // using setposts function from dataprovider to assign value we got from server
    func listenUpdates() {
        firestoreService?.listenUpdates { (posts) in
            self.dataProvider?.setPosts(posts: posts)
        }
    }
}
