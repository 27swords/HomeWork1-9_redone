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

        // Configure the view for the selected state
    }

}
