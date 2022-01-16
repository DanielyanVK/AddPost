//
//  FireStorageService.swift
//  AddPost
//
//  Created by Vladislav on 05.01.2022.
//

import UIKit
// protocol for FireStorageImplementation
// NOTE: CURRENTLY USING SINGLETONS INSTEAD OF PROTOCOLS. ADDED THEM FOR FUTURE REFERENCE
protocol FireStorageService {
    func uploadImage(_ image: UIImage, completion: @escaping (String) -> Void)
}
