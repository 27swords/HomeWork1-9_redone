//
//  FriendsModel.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 15.06.22.
//

import Foundation

class FriendsModel: Codable {
    
    let response: ResponseFriends
}

struct ResponseFriends: Codable {

    let count: Int
    let items: [FriendsData]
}

struct FriendsData: Codable {

    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo100 = "photo_100"
    }
}
