//
//  GroupsModel.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 15.06.22.
//

import Foundation
import RealmSwift

class GroupsModel: Object ,Codable {
    var response: ResponseGroups
}

class ResponseGroups: Object, Codable {
    var items: [GroupData]
}

class GroupData: Object, Codable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    var type: TypeEnum
    @objc dynamic var photo100: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case type = "type"
        case photo100 = "photo_100"
    }
}

enum TypeEnum: String, Codable {
    case group = "group"
    case page = "page"
}
