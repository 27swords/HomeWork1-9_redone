//
//  FriendsCollectionViewController.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 12.04.22.
//

import UIKit

private let reuseIdentifier = "Cell"

class FriendsCollectionViewController: UICollectionViewController {
    
    var friendsPhotos: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendsPhotos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? FriendsCollectionViewCell
        let friendPhoto = friendsPhotos[indexPath.item]
        cell?.friendsPhotoImage.image = UIImage(named: friendPhoto)
        
        return cell ?? UICollectionViewCell()
    }
    
    
}
