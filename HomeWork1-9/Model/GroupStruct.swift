//
//  GroupStruct.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 12.04.22.
//


import UIKit

struct AllGroup {
    let idGroup: String
    let nameGroup: String
    let photoGroup: String
}

var subscribedGroups: [AllGroup] = [AllGroup(idGroup: "1", nameGroup: "Сonversation", photoGroup: "comment"),
                                    AllGroup(idGroup: "2", nameGroup: "Party", photoGroup: "champagne"),
                                    AllGroup(idGroup: "3", nameGroup: "NewYear", photoGroup: "fireworks"),
                                    AllGroup(idGroup: "4", nameGroup: "Work searches", photoGroup: "success"),
                                    AllGroup(idGroup: "5", nameGroup: "Memes", photoGroup: "positive-review"),]

var unSubscribedGroups: [AllGroup] = [AllGroup(idGroup: "1", nameGroup: "Party", photoGroup: "champagne"),
                                      AllGroup(idGroup: "2", nameGroup: "Сonversation", photoGroup: "comment"),
                                      AllGroup(idGroup: "3", nameGroup: "NewYear", photoGroup: "fireworks"),
                                      AllGroup(idGroup: "4", nameGroup: "Work searches", photoGroup: "success"),
                                      AllGroup(idGroup: "5", nameGroup: "Memes", photoGroup: "positive-review"),]
