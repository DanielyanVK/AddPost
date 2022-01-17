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
    let firestore = FirestoreServiceImplementation.shared
    let storage = StorageServiceImplementation.shared
    // Defining how we upload image and save data
    func uploadAndSend(timePosted: TimeInterval, textPosted: String, pickedImage: UIImage) {
        storage.uploadImage(pickedImage) {(imageUrl) in
            // updating our data source
            let dataSource = PostModel(textPosted: textPosted, imageSource: imageUrl, timePosted: timePosted)
            self.firestore.save(dataSource) { (result) in
                print(result)
            }
        }
    }
}
