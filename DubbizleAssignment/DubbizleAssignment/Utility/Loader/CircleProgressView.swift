//
//  CircleProgressView.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/23/20.
//

import Foundation
import UIKit

class CircleProgressView: UIView {
    
    let progressShape = CAShapeLayer()
    var color: CGColor = UIColor.black.cgColor
    lazy var width: CGFloat = {
        return self.frame.size.width - 2
    }()
    
    func stopProgressAnimation() {
        progressShape.removeFromSuperlayer()
    }
    
    func addCircleProgress() {
        
        let cp = UIBezierPath(arcCenter: CGPoint(x: width/2, y: width/2), radius: width/2, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)
        progressShape.path = cp.cgPath
        progressShape.strokeColor = color
        progressShape.fillColor = UIColor.clear.cgColor
        progressShape.lineWidth = 2
        progressShape.strokeEnd = 0
        
        let frame = CGRect(x: (self.layer.bounds.size.width - width) / 2,
                           y: (self.layer.bounds.size.height - width) / 2,
                           width: width,
                           height: width)
        
        progressShape.frame = frame
        let p = 2 * Double.pi * 100
        let one: NSNumber = NSNumber( value: p - 30)
        let two: NSNumber = 7
        let two2: NSNumber = 3
        progressShape.lineDashPattern = [two2,two,two,two,one]
        progressShape.lineCap = .round
        
        self.layer.addSublayer(progressShape)
        self.animationStart()
    }
    
    @objc private func animationStart() {
        
        let scaleAnimation = CAKeyframeAnimation(keyPath: "strokeEnd")
        
        scaleAnimation.values = [0, 0.5, 1.0, 0.5,0]
        
        let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        
        rotateAnimation.values = [0, Double.pi, 2 * Double.pi, 4 * Double.pi, 6 * Double.pi]
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [rotateAnimation,scaleAnimation]
        #if swift(>=4.2)
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        #else
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        #endif
        animation.duration = 5
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        progressShape.add(animation, forKey: "animation")
        
    }
    
    static func showProgress(view: UIView, blockView: Bool = true) {
        if let v = view.viewWithTag(1100) as? CircleProgressView {
            view.addSubview(v)
            v.addCircleProgress()
        }
        else {
            let v = CircleProgressView(frame: CGRect(x: view.bounds.size.width/2-25, y: view.bounds.size.height/2-25, width: 50, height: 50))
            v.tag = 1100
            view.addSubview(v)
            v.addCircleProgress()
        }
        view.isUserInteractionEnabled = !blockView
    }
    
    static func hideProgress(view: UIView) {
        if let v = view.viewWithTag(1100) as? CircleProgressView {
            v.stopProgressAnimation()
            v.removeFromSuperview()
        }
        view.isUserInteractionEnabled = true
    }


}
