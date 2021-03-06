//
//  PhotoFriendsService.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 15.06.22.
//

import Foundation
import RealmSwift

final class PhotoService {
    typealias PhotoResult = Result<[PhotosData], Constants.Service.ServiceError>
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    
    /// функция добавления фотографий пользователя
    func loadPhotoVK(ownerID: Int, completion: @escaping (PhotoResult) -> ()) {
        guard let token = Session.shared.token else {
            return completion(.failure(.notConfigureURL))
        }
        
        // параметры фотографий 
        let params: [String: String] = [
            "owner_id" : "\(ownerID)",
            "album_id" : "wall",
            "v" : "5.131",
            "extended" : "0"
        ]
        
        do {
            let url: URL = try .configureUrl(token: token,
                                             method: .photosGet,
                                             params: params)
            
            var request = URLRequest(url: url)
            
            request.httpMethod = Constants.Service.get.rawValue
            
            session.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode(PhotosModel.self, from: data)
                    completion(.success(result.response.items))
                    
                } catch {
                    completion(.failure(.parseError))
                }
            }.resume()
        } catch {
            completion(.failure(.notConfigureURL))
        }
    }
    
    ///  Метод сохранения фотографий
    func saveGroupData(_ photos: [PhotosModel]) {
        
        do {
            
            let realm = try Realm()
            
            realm.beginWrite()
            realm.add(photos)
            
            try realm.commitWrite()
       
        } catch {
           
            print(error)
        }
    }
}
