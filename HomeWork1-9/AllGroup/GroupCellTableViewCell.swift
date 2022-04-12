//
//  GroupCellTableViewCell.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 7.04.22.
//

import UIKit

class GroupCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var phorosAllGroupImage: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
