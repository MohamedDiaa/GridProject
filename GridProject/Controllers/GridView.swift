//
//  GridView.swift
//  GridProject
//
//  Created by Diaa Alwakil on 2018-01-23.
//  Copyright © 2018 Diaa Alwakil. All rights reserved.
//

import UIKit

struct Line{
    let start: CGPoint
    let end: CGPoint
}

class GridView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
   // let numberOfLines:CGFloat = 100
    override func draw(_ rect: CGRect) {

        
        //Get graphics context
        guard let context = UIGraphicsGetCurrentContext()
            else { return }
        
        context.setStrokeColor(UIColor.lightGray.cgColor)
        context.setLineWidth(1)

        _ = stride(from: 0, to: rect.size.width, by: 10).flatMap{
            xOffset in
            
            let line = Line(start: CGPoint(x: xOffset, y: 0), end: CGPoint(x: xOffset, y: rect.size.height))
            context.draw(line: line)
        }
        
        _ = stride(from: 0, to: rect.size.height, by: 10).flatMap{
            yOffset in
            
            let line = Line(start: CGPoint(x: 0, y: yOffset), end: CGPoint(x: rect.size.width, y: yOffset))
            context.draw(line: line)
        }
        //Draw vertical lines
        
        //Draw horizontal lines
        
        //Done
    }
}

extension CGContext{
    
    func draw(line:Line){
        self.move(to: line.start)
        self.addLine(to: line.end)
        self.strokePath()
    }
}
