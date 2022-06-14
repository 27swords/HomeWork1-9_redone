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
    let date: Int
    let id: Int
    let ownerID: Int?
    let postID: Int?
    let sizes: [Size]
    let likes: Likes
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date = "date"
        case id = "id"
        case ownerID = "owner_id"
        case postID = "post_id"
        case sizes = "sizes"
        case likes
        case text = "text"
    }
}

struct Likes: Codable {
    
    let count: Int
    let userLikes: Int
    
    enum CodingKeys: String, CodingKey {
        case count
        case userLikes = "user_likes"
    }
}

struct Size: Codable {

    let height: Int
    let url: String
    let type: String
    let width: Int
}
