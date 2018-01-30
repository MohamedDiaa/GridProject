//
//  CirclesGridView.swift
//  GridProject
//
//  Created by Diaa Alwakil on 2018-01-23.
//  Copyright © 2018 Diaa Alwakil. All rights reserved.
//

import UIKit

class CirclesGridView: UIView {

    var selectedLocation:CGPoint?
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        guard let selectedLocation = self.selectedLocation,let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        
        //Draw Circular grid
        
        context.setLineWidth(0.7)
        context.setStrokeColor(UIColor.lightGray.cgColor)
        let maxSide = max(rect.size.width, rect.size.height)
        
        _ = stride(from: 0, to: maxSide, by: 5).flatMap {
            
            context.addArc(center: selectedLocation, radius: $0, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: false)
        }
        
        context.strokePath()
        
        //Draw Horizontal and vertical lines at the point
        
        context.setStrokeColor(UIColor.red.cgColor)

        let hline = Line(start: CGPoint(x: 0, y: selectedLocation.y), end: CGPoint(x: rect.size.width , y: selectedLocation.y))
        context.draw(line: hline)
        
        let vline = Line(start: CGPoint(x: selectedLocation.x, y: 0), end: CGPoint(x: selectedLocation.x , y: rect.size.height))
        context.draw(line: vline)
        
        context.strokePath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first
            else { return }
        
        let point = touch.location(in: self)
        self.selectedLocation = point
        
        self.setNeedsDisplay()
        }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first
            else { return }
        
        let point = touch.location(in: self)
        self.selectedLocation = point
        
        self.setNeedsDisplay()
    }
    
    
}

// context.addArc(center: selectedLocation, radius: $0, startAngle: 0, endAngle: 2*CGFloat.pi - 1, clockwise: true)

