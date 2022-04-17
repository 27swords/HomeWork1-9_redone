//
//  AvatarView.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 17.04.22.
//

import UIKit


class AvatarView: UIView {
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }

        context.setFillColor(UIColor.clear.cgColor)

        let path = UIBezierPath(roundedRect: rect, cornerRadius: 50)
        path.fill()
    }
}
