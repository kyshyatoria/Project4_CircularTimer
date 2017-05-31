//
//  CircleView.swift
//  Super Vision
//
//  Created by kanchan yadav on 5/24/17.
//  Copyright © 2017 kanchan yadav. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    
    
    var circleLayer: CAShapeLayer!
    var circleLayer1: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        self.createGreyCircle()
        self.createGreenCircle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.createGreyCircle()
        self.createGreenCircle()
    }
    
   
    private func createGreyCircle(){
        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: 0.0, endAngle: CGFloat(.pi * 2.0), clockwise: true)
        
        // Setup the CAShapeLayer with the path, colors, and line width
        circleLayer1 = CAShapeLayer()
        circleLayer1.path = circlePath.cgPath
        circleLayer1.fillColor = UIColor.clear.cgColor
        circleLayer1.strokeColor = UIColor(white: 0.0, alpha: 0.1).cgColor
        circleLayer1.lineWidth = 10.0;
        
        // Don't draw the circle initially
        circleLayer1.strokeEnd = 1.0
        
        // Add the circleLayer to the view's layer's sublayers
        layer.addSublayer(circleLayer1)
    }
    
    private func createGreenCircle(){
        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
//TODO: need to check angle.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: -.pi/2, endAngle: CGFloat(.pi * 2.0), clockwise: true)
        
        // Setup the CAShapeLayer with the path, colors, and line width
        circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor(colorLiteralRed: 9/255, green: 255/255, blue: 138/255, alpha: 0.65).cgColor
        circleLayer.lineWidth = 10.0;
        
        // Don't draw the circle initially
        circleLayer.strokeEnd = 0.0
        
        // Add the circleLayer to the view's layer's sublayers
        layer.addSublayer(circleLayer)
    }
    
    func animateCircle(duration: TimeInterval) {
        // We want to animate the strokeEnd property of the circleLayer
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = duration
        
        // Animate from 0 (no circle) to 1 (full circle)
        animation.fromValue = 0
        animation.toValue = 1
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        circleLayer.strokeEnd = 1.0
        
        // Do the actual animation
        circleLayer.add(animation, forKey: "animateCircle")
    
    }
    
    
}
