//
//  FireStoreService.swift
//  AddPost
//
//  Created by Vladislav on 05.01.2022.
//
import Foundation
import FirebaseFirestore
import Firebase
import FirebaseDatabase

class FirestoreService {
    private init() {}
    // Creating singleton pattern and database to store data in Firestore
    static let shared = FirestoreService()
    private let database = Firestore.firestore()
    // Think of .collection basically as folder in Firestore
    private lazy var postReference = database.collection("posts")
    
    // Adding function to save data. Including error handling found in documentation
    func save(_ post: PostModel, completion: @escaping (Result<Bool, NSError>) -> Void) {
        postReference.addDocument(data: ["textPosted" : post.textPosted,
                                         "imageSource" : post.imageSource,
                                         "timePosted" : post.timePosted])
        { (error) in
            if let unwrappedError = error {
                completion(.failure(unwrappedError as NSError))
            } else {
                completion(.success(true))
            }
        }
    }
    // function to update database in real time
    func listenUpdates(completion: @escaping ([PostModel]) -> Void) {
        postReference.addSnapshotListener { (snapshot, error) in
            // ensuring we got snapshot
            guard let unwrappedSnapshot = snapshot else {
                print ("Document data was empty.")
                return
            }
            var posts = [PostModel]()
            posts.removeAll()
            // getting unwrapped data
            let documents = unwrappedSnapshot.documents
            // unwrapping data as dictionary
            for document in documents {
                let documentData = document.data()
                // assigning type of value we neeed to keys we got
                let textPosted = documentData["textPosted"] as? String ?? ""
                let imageSource = documentData["imageSource"] as? String ?? ""
                let timePosted = documentData["timePosted"] as? Double ?? 0.0
                // Declaring how we want to store this data in our model
                let updatedPost = PostModel(textPosted: textPosted, imageSource: imageSource, timePosted: timePosted)
                // appending values
                posts.append(updatedPost)
            }
            completion(posts)
        }
    }
}
