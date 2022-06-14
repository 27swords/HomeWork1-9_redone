//
//  GroupsModel.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 15.06.22.
//

import Foundation

struct GroupsModel: Codable {
    let response: ResponseGroups
}

struct ResponseGroups: Codable {
    let items: [GroupData]
}

struct GroupData: Codable {
    
    let id: Int
    let name: String
    let type: TypeEnum
    let photo100: String
    
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
