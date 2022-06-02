//
//  prostoSwiftFile.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 12.05.22.
//

import Foundation

// Singleton
final class Session {
    
    static let session = Session()
    
    private init() {}
    
    // Access token
    var token: String?
    var userID: Int?
}
