//
//  File.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 23.04.22.
//

import UIKit

class LikePostControl: UIControl {
    
    @IBOutlet weak var likePostControl: UIImageView?
    @IBOutlet weak var likePostLabel: UILabel?
    
    var likeCounter: Int = 0
    
    override var isSelected: Bool {
        didSet {
            likePostControl?.image = isSelected ? UIImage(named: "thumbs-up") : UIImage(named: "disableLikes")
            
            if isSelected {
                likeCounter += 1
            } else {
                likeCounter -= 1
            }
            
            likePostLabel?.text = "\(likeCounter)"
        }
    }
}
