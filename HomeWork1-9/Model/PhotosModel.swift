//
//  PhotosModel.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 15.06.22.
//

import Foundation

struct PhotosModel: Codable {
    
    let response: ResponsePhotos
}

struct ResponsePhotos: Codable {
    
    let count: Int
    let items: [PhotosData]
    
}

struct PhotosData: Codable {

    let albumID: Int
    let id: Int
    let ownerID: Int?
    let sizes: [Size]
    
    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id = "id"
        case ownerID = "owner_id"
        case sizes = "sizes"
    }
}

struct Size: Codable {

    let height: Int
    let url: String
    let type: String
    let width: Int
}
