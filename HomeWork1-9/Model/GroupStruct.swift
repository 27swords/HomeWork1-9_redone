//
//  GroupStruct.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 12.04.22.
//

import Foundation
import UIKit

struct AllGroup {
    let nameGroup: String
    let photoGroup: String
    
    static var groupsNames: [AllGroup] = [
        AllGroup(nameGroup: "Сonversation", photoGroup: "comment"),
        AllGroup(nameGroup: "Party", photoGroup: "champagne"),
        AllGroup(nameGroup: "NewYear", photoGroup: "fireworks"),
        AllGroup(nameGroup: "Work searches", photoGroup: "success"),
        AllGroup(nameGroup: "Memes🤡", photoGroup: "positive-review")
        ]
}
