//
//  FriendsStruct.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 12.04.22.
//

import Foundation

struct Friend {
    let name: String
    let avatar: String
    let photos: [String]
    
    static var friends: [Friend] = [
        
        Friend(name: "Mark", avatar: "Mark_image", photos: ["Mark_image"]),
        Friend(name: "Alice", avatar: "Alice_image", photos: ["Alice_image"]),
        Friend(name: "Liza", avatar: "Liza_image", photos: ["Liza_image"]),
        Friend(name: "Adam", avatar: "Adam_image", photos: ["Adam_image"]),
        Friend(name: "Max", avatar: "Max_image", photos: ["Max_image"]),
        Friend(name: "Alex", avatar: "Alex_image", photos: ["Alex_image"]),
        Friend(name: "Dashka", avatar: "Dashka_image", photos: ["Dashka_image"])
        ]
}
