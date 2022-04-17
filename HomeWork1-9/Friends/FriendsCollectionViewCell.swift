//
//  FriendsCollectionViewCell.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 12.04.22.
//

import UIKit

class FriendsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var likeControl: LikeControl!
    @IBOutlet weak var friendsPhotoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Avatar form in the user profile
        friendsPhotoImage.layer.cornerRadius = 30
        friendsPhotoImage.contentMode = .scaleAspectFill
        friendsPhotoImage.layer.masksToBounds = true
        
        likeControl.addTarget(self, action: #selector(likeControlTapped), for: .touchUpInside)
    }
    
    @objc func likeControlTapped() {
        likeControl.isSelected = !likeControl.isSelected
    }
}
