//
//  PostInteractor.swift
//  AddPost
//
//  Created by Vladislav on 15.01.2022.
//

import Foundation
import FirebaseDatabase
import FirebaseFirestore

// handles most of the logic
class PostInteractor {
    let firestore = FirestoreServiceImplementation.shared
    
    var dataProvider: PostDataProvidable?
    
    init(dataProvider: PostDataProvidable) {
        self.dataProvider = dataProvider
    }
    
    func listenUpdates() {
        firestore.listenUpdates { (posts) in
            self.dataProvider?.setPosts(posts: posts)
        }
    }
}
