//
//  VkSearchGroupsService.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 30.05.22.
//
/// Получение групп по поисковому запросу 

import UIKit

final class VkSearchGroups {

    // Search request method
    func VkSearchGroupsService(searchText: String) {

        guard let token = Session.session.token else { return }

        var urlComponents = URLComponents()

        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.search"
        urlComponents.queryItems = [

            URLQueryItem(name: "q", value: searchText),
            URLQueryItem(name: "type", value: "group"),
            URLQueryItem(name: "sort", value: "0"),
            URLQueryItem(name: "count", value: "10"),
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
