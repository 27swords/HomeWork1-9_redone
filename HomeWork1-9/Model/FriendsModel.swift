//
//  FriendsModel.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 15.06.22.
//

import Foundation
import RealmSwift

class FriendsModel: Object, Codable {
    
    var response: ResponseFriends
}

class ResponseFriends: Object, Codable {

    @objc dynamic var count: Int = 0
    var items: [FriendsData]
}

class FriendsData: Object, Codable {

    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var photo100: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo100 = "photo_100"
    }
}
