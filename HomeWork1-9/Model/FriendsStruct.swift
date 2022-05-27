//
//  FriendsStruct.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 12.04.22.
//

import Foundation

struct Photo {
    
    let namePhoto: String
}

struct Friend {
    
    let id: UUID = .init()
    let name: String
    let avatar: Photo
    let photos: [Photo]

}

var allFriends = [
    Friend(
        name: "Mark",
        avatar:Photo(namePhoto: "Mark_image"),
        photos: [Photo(namePhoto: "Mark_image"),
                 Photo(namePhoto: "Alice_image")]),
   
    Friend(
        name: "Alice",
        avatar: Photo(namePhoto: "Alice_image"),
        photos: [Photo(namePhoto: "Alice_image")]),
    
    Friend(
        name: "Liza",
        avatar: Photo(namePhoto: "Liza_image"),
        photos: [Photo(namePhoto: "Liza_image")]),
    
    Friend(
        name: "Adam",
        avatar: Photo(namePhoto: "Adam_image"),
        photos: [Photo(namePhoto: "Adam_image")]),
    
    Friend(
        name: "Max",
        avatar: Photo(namePhoto: "Max_image"),
        photos: [Photo(namePhoto: "Max_image")]),
    
    Friend(
        name: "Alex",
        avatar: Photo(namePhoto: "Alex_image"),
        photos: [Photo(namePhoto: "Alex_image")]),
    
    Friend(
        name: "Dashka",
        avatar: Photo(namePhoto: "Dashka_image"),
        photos: [Photo(namePhoto: "Dashka_image")])

]
