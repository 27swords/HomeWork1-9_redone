//
//  GradientLoginView.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 18.04.22.
//

import UIKit

class GradientLoginView: UIView {
    
    var startColor: UIColor = .systemPink
    var endColor: UIColor = .systemOrange
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let colors = [startColor.cgColor, endColor.cgColor]
    
    
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let colorLocation: [CGFloat] = [0.0, 1.0]
    
    guard let gradient = CGGradient(
        colorsSpace: colorSpace,
        colors: colors as CFArray,
        locations: colorLocation
    ) else {
        return
        }
        
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: bounds.height)
        context.drawLinearGradient(
            gradient,
            start: startPoint,
            end: endPoint,
            options: []
        )
    }
}
