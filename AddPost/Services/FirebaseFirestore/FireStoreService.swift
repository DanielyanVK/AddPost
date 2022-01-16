//
//  FireStoreService.swift
//  AddPost
//
//  Created by Vladislav on 05.01.2022.
//
import Foundation
// conforming to FireStorageService protocol
// implementation should hold all the logic behind functions we defined in protocol

// NOTE: CURRENTLY USING SINGLETONS INSTEAD OF PROTOCOLS. ADDED THEM FOR FUTURE REFERENCE
protocol FirestoreService {
    func save(_ post: PostModel, completion: @escaping (Result<Bool, NSError>) -> Void)
    func listenUpdates(completion: @escaping ([PostModel]) -> Void)
}
