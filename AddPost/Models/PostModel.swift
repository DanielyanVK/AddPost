//
//  PostModel.swift
//  AddPost
//
//  Created by Vladislav on 04.01.2022.
//

import Foundation

struct PostModel: Codable {
    let textPosted: String
    let imageSource: String
    let timePosted: TimeInterval
}
