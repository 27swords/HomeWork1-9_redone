//
//  PhotosModel.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 15.06.22.
//

import Foundation
import RealmSwift

class PhotosModel: Object, Codable {
    
    var response: ResponsePhotos
}

class ResponsePhotos: Object, Codable {
    
    @objc dynamic var count: Int = 0
    let items: [PhotosData]
    
}

class PhotosData: Object, Codable {

    @objc dynamic var albumID: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var ownerID: Int = 0
    var sizes: [Size]
    
    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id = "id"
        case ownerID = "owner_id"
        case sizes = "sizes"
    }
}

class Size: Object, Codable {

    @objc dynamic var height: Int = 0
    @objc dynamic var url: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var width: Int = 0
}
