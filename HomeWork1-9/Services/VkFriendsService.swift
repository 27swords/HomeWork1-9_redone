//
//  VkFriendsService.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 27.05.22.
//
/// Получение списка друзей 

import UIKit

final class VkFriends {

    // Friends request method 
    func loadFriendsVk() {
        
        guard let token = Session.session.token else { return }
        
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [
        
            URLQueryItem(name: "order", value: "hints"),
            URLQueryItem(name: "count", value: "50"),
            URLQueryItem(name: "fields", value: "city, online, country"),
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = urlComponents.url else { return }

        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(result)
            } catch {
                print(error)
            }
        }.resume()
    }
}
