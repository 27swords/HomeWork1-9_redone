//
//  FriendsCollectionViewController.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 12.04.22.
//

import UIKit

class FriendsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var frinedsIndex: Int = 0
    
    var friend: Friend {
        return allFriends[frinedsIndex]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? FriendsCollectionViewCell
        let photo = friend.photos[indexPath.row]
        
        cell?.friendsPhotoImage.image = UIImage(named: photo.namePhoto)
        
        return cell ?? UICollectionViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let swipeVC = segue.destination as? PhotoSwipeViewController {
            swipeVC.photos = friend.photos
        }
    }
}
