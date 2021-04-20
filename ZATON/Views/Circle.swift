//
//  Circle.swift
//  ZATON
//
//  Created by Константин on 05.04.2021.
//

import UIKit
import GLKit

final class Circle: UIView {
    
    var borderWidth: CGFloat
    var diameter: CGFloat
    
    init(border: CGFloat, diameter: CGFloat) {
        self.borderWidth = border
        self.diameter = diameter
        super.init(frame: .zero)
        setupUI()
    }
    
    private func setupUI() {
        self.frame.size = CGSize(width: self.diameter, height: self.diameter)
        self.backgroundColor = .clear
        self.layer.borderWidth = self.borderWidth
        self.layer.cornerRadius = self.diameter / 2
        self.layer.borderColor = UIColor(red: 0.205, green: 0.792, blue: 0.498, alpha: 0.6).cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


final class GroupCircles: UIView {
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    private func setupUI() {
        let screenSize = UIScreen.main.bounds
        self.frame.size = CGSize(width: screenSize.width * 1.12, height: screenSize.height * 0.47)
        
        let circle1 = Circle(border: 20, diameter: 290)
        circle1.frame.origin = CGPoint(x: 0, y: 0)
        let circle2 = Circle(border: 2, diameter: 290)
        circle2.frame.origin = CGPoint(x: 0, y: self.frame.size.height - 290)
        let circle3 = Circle(border: 2, diameter: 126)
        circle3.frame.origin = CGPoint(x: self.frame.size.width - 126, y: self.frame.size.height - 219)
        let circle4 = Circle(border: 10, diameter: 54)
        circle4.frame.origin = CGPoint(x: self.frame.size.width - 54, y: self.frame.size.width - 261)
        
        self.addSubview(circle1)
        self.addSubview(circle2)
        self.addSubview(circle3)
        self.addSubview(circle4)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class CircleClosing: UIView {
    
    let circleLayer = CAShapeLayer()
    var startAngle: CGFloat = 0.0
    var endAngle: CGFloat = CGFloat(Double.pi * 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear

        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        
        // Setup the CAShapeLayer with the path, colors, and line width
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineWidth = 5.0;

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
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)

        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        circleLayer.strokeEnd = 1.0

        // Do the actual animation
        circleLayer.add(animation, forKey: "animateCircle")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
