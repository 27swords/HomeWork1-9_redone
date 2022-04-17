//
//  likeControl.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 17.04.22.
//

import UIKit

class LikeControl: UIControl {

    @IBOutlet weak var likeView: UIImageView?
    @IBOutlet weak var counterLabel: UILabel?
    
    var likesCounter: Int = 0
    
    // The function of clicking on the like
    override var isSelected: Bool {
        didSet {
            likeView?.image = isSelected ? UIImage(named: "like") : UIImage(named: "disable like")
            
            if isSelected {
                likesCounter += 1
            } else {
                likesCounter -= 1
            }
            
            counterLabel?.text = "\(likesCounter)"
        }
    }
}
