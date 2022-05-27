//
//  prostoSwiftFile.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 12.05.22.
//

import Foundation

class Session {
    
    private init() {
        self.token = String()
        self.userID = Int()
    }

    var token: String
    var userID: Int

    static var session = Session()

}
