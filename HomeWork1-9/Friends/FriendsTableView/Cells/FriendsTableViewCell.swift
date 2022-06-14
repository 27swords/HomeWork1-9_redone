//
//  FriendsTableViewCell.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 12.04.22.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendsImage: UIImageView!
    @IBOutlet weak var nameFriendsLabel: UILabel!
    @IBOutlet weak var avatarCellView: AvatarView!
    
    var animator: UIViewPropertyAnimator?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Сreating an avatar form
        friendsImage.layer.cornerRadius = 30
        friendsImage.contentMode = .scaleAspectFill
        friendsImage.layer.masksToBounds = true
        
        // Сreating avatar shadows
        friendsImage.layer.shadowColor = UIColor.black.cgColor
        friendsImage.layer.shadowOpacity = 0.5
        friendsImage.layer.shadowRadius = 8
        friendsImage.layer.shadowOffset = CGSize.zero 
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        avatarCellView.isUserInteractionEnabled = true
        avatarCellView.addGestureRecognizer(imageTap)
        
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: UIImageView.AnimationOptions.allowUserInteraction,
                       animations: {
            
            self.avatarCellView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.avatarCellView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: 0.15,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0,
                           options: UIImageView.AnimationOptions.allowUserInteraction,
                           animations: {
                
                self.avatarCellView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.friendsImage.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            
        }
    }
}
