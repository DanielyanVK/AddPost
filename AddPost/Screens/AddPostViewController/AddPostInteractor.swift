//
//  AddPostInteractor.swift
//  AddPost
//
//  Created by Vladislav on 16.01.2022.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore
import FirebaseDatabase

class AddPostIntercator {
    
    private let firestoreService: FirestoreService?
    private let fireStorageService: FireStorageService?
    
    init(firestoreService: FirestoreService, fireStroageService: FireStorageService) {
        self.firestoreService = firestoreService
        self.fireStorageService = fireStroageService
    }
    
    // Defining how we upload image and save data
    func uploadAndSend(timePosted: TimeInterval, textPosted: String, pickedImage: UIImage) {
        fireStorageService?.uploadImage(pickedImage) {(imageUrl) in
            // updating our data source
            let dataSource = PostModel(textPosted: textPosted, imageSource: imageUrl, timePosted: timePosted)
            self.firestoreService?.save(dataSource) { (result) in
                print(result)
            }
        }
    }
}
