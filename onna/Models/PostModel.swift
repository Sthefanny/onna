//
//  PostModel.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 18/09/21.
//

import Foundation

struct Post: Decodable, Identifiable {
    let id: Int
    let userImage: String?
    let userName: String
    let text: String
    let likeQuantity: Int
    let commentQuantity: Int
    let hasLiked: Bool
    let canDelete: Bool
    let comments: [Comments]?
}


struct Comment: Decodable {
    let postId: Int
    let text: String
}


struct Comments: Decodable, Identifiable {
    let id: Int
    let userImage: String?
    let userName: String
    let text: String
    let canDelete: Bool
}
