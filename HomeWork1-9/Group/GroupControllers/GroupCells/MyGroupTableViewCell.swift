//
//  MyGroupTableViewCell.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 7.04.22.
//

import UIKit

class MyGroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photosMyGroupImage: UIImageView!
    @IBOutlet weak var myGroupLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
