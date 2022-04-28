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
    @IBOutlet weak var likeStackView: LikeControl!
    
    var markedAsLiked: ((Bool) -> Void)?
    
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
        markedAsLiked?(likeControl.isSelected)
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [ UIImageView.AnimationOptions.allowUserInteraction, .curveEaseInOut],
                       animations: {
            self.likeControl.likeView?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            
        }) { _ in
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0,
                           options: [ UIImageView.AnimationOptions.allowUserInteraction, .curveEaseInOut],
                           animations: {
                self.likeControl.likeView?.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            
        }
    }
}
