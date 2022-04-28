//
//  NewsTableViewCell.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 22.04.22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarGroupImage: UIImageView!
    @IBOutlet weak var nameGroupNewsLabel: UILabel!
    @IBOutlet weak var disableLikeImage: UIImageView!
    @IBOutlet weak var commentsImage: UIImageView!
    @IBOutlet weak var repostImage: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    
    var markedAsLiked: ((Bool) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarGroupImage.layer.masksToBounds = true
        avatarGroupImage.layer.cornerRadius = avatarGroupImage.frame.size.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
