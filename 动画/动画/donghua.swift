//
//  donghua.swift
//  动画
//
//  Created by 周逸文 on 16/12/15.
//  Copyright © 2016年 xxxx. All rights reserved.
//

import Foundation
import UIKit



var BtnFrame: CGRect?

var animating: Bool = false

let progressBarHeight: CGFloat = 40
let progressBarWidth: CGFloat = 200


extension UIButton: CAAnimationDelegate {
    
    
    
    func tapped()  {
        
        if animating {
            return
        }
        
        BtnFrame = self.frame
        
        self.backgroundColor = UIColor(colorLiteralRed: 0, green: 122/255.0, blue: 255/255.0, alpha: 1.0)
        
        animating = true
        
        self.layer.cornerRadius = progressBarHeight/2
        
        let radiusAnimation = CABasicAnimation(keyPath: "CABasicAnimation")
        
        radiusAnimation.duration = 0.2
        
        radiusAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        radiusAnimation.fromValue = (BtnFrame?.size.height)!/2
        
        radiusAnimation.delegate = self
        
        self.layer.add(radiusAnimation, forKey: "cornerRadiusShrinkAnim")
        
        
    }
    ///代理方法
    public func animationDidStart( _ anim: CAAnimation) {
        
        if anim == self.layer.animation(forKey: "cornerRadiusShrinkAnim") {
            
            UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
                self.bounds = CGRect(x: 0, y: 0, width: progressBarWidth, height: progressBarHeight)
            }, completion: { (finished) in
                self.layer.removeAllAnimations()
                self.progressBarAnimation()
            })
        }
        
        if anim == self.layer.animation(forKey: "cornerRadiusExpandAnim") {
            
            UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
                self.bounds = CGRect(x: 0, y: 0, width: (BtnFrame?.size.width)!, height: (BtnFrame?.size.height)!)
                self.backgroundColor = UIColor.init(red: 0.1803921568627451, green: 0.8, blue: 0.44313725490196076, alpha: 1.0)
            }, completion: { (finished) in
                self.layer.removeAllAnimations()
                self.checkAnimation()
                //---
                animating = false
            })
        }
    }
    
    func progressBarAnimation() {
        
        let progressLayer = CAShapeLayer()
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: progressBarHeight/2, y: self.bounds.size.height/2))
        
        path.addLine(to: CGPoint(x: self.bounds.size.width-progressBarHeight/2, y: self.bounds.size.height/2))
        
        progressLayer.path = path.cgPath
        
        progressLayer.strokeColor = UIColor.white.cgColor
        
        progressLayer.lineWidth = progressBarHeight-6
        
        progressLayer.lineCap = kCALineCapRound
        
        self.layer.addSublayer(progressLayer)
        
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        pathAnimation.duration = 2.0
        
        pathAnimation.fromValue = 0.0
        
        pathAnimation.toValue = 1.0
        
        pathAnimation.delegate = self
        
        pathAnimation.setValue("progressBarAnimation", forKey: "animationName")
        
        progressLayer.add(pathAnimation, forKey: nil)
        
    }
    
    
    ///代理方法
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if anim.value(forKey: "animationName") as? String == "progressBarAnimation" {
            
            UIView.animate(withDuration: 0.3, animations: {
                for subLayer in self.layer.sublayers!{
                    
                    subLayer.opacity = 0.0
                    
                }
            }, completion: { (finished) in
                
                for subLayer in self.layer.sublayers!{
                    
                    subLayer.removeFromSuperlayer()
                    
                }
                
                self.layer.cornerRadius = (BtnFrame?.size.height)!/2
                
                let radiusAnimation:CABasicAnimation = CABasicAnimation(keyPath: "cornerRadius")
                
                radiusAnimation.duration = 0.2
                
                radiusAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
                
                radiusAnimation.fromValue = progressBarHeight/2
                
                radiusAnimation.delegate = self
                
                self.layer.add(radiusAnimation, forKey: "cornerRadiusExpandAnim")
                
            })
        }
    }
    
    func checkAnimation() {
        let checkLayer = CAShapeLayer()
        
        let path = UIBezierPath()
        
        let rectInCircle = self.bounds.insetBy(dx: self.bounds.size.width*(1-1/sqrt(2.0))/2, dy: self.bounds.size.width*(1-1/sqrt(2.0))/2)
        
        path.move(to: CGPoint(x: rectInCircle.origin.x + rectInCircle.size.width/9, y: rectInCircle.origin.y + rectInCircle.size.height*2/3))
        
        path.addLine(to: CGPoint(x: rectInCircle.origin.x + rectInCircle.size.width/3, y: rectInCircle.origin.y + rectInCircle.size.height*9/10))
        
        path.addLine(to: CGPoint(x: rectInCircle.origin.x + rectInCircle.size.width*8/10, y: rectInCircle.origin.y + rectInCircle.size.height*2/10))
        
        checkLayer.path = path.cgPath
        
        checkLayer.fillColor = UIColor.clear.cgColor
        
        checkLayer.strokeColor = UIColor.white.cgColor
        
        checkLayer.lineWidth = 10.0
        
        checkLayer.lineCap = kCALineCapRound
        
        checkLayer.lineJoin = kCALineJoinRound
        
        self.layer.addSublayer(checkLayer)
        
        let checkAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        checkAnimation.duration = 0.3
        
        checkAnimation.fromValue = 0.0
        
        checkAnimation.toValue = 1.0
        
        checkAnimation.delegate = self
        
        checkAnimation.setValue("checkAnimation", forKey: "animationName")
        
        checkLayer.add(checkAnimation, forKey: nil)
        
        
    }
    
    func recovery()  {
        
        self.layer.sublayers?.removeAll()
        
        self.backgroundColor = UIColor(colorLiteralRed: 0, green: 122/255.0, blue: 255/255.0, alpha: 1.0)
        
    }
}
