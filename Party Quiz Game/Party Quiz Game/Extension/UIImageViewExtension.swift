//
//  UIImageViewExtension.swift
//  SimpleBuzzer
//
//  Created by Pasquale Bruno on 17/02/2018.
//  Copyright © 2018 Giovanni Frate. All rights reserved.
//

import UIKit
import Foundation

extension UIImageView {
  
  func oneBuzzerTutorial(value: Float, view: UIView) {
    
    let animation = CABasicAnimation(keyPath: "position")
    animation.fromValue = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
    animation.toValue = CGPoint(x: view.bounds.midX, y: (view.bounds.midY * CGFloat(value)))
    animation.duration = 0.5
    animation.autoreverses = true
    animation.repeatCount = Float.infinity
    
    layer.add(animation, forKey: nil)
  }
  
  func leftHandBuzzerTutorial(value: Float, view: UIView) {
    
    let animation = CABasicAnimation(keyPath: "position")
    animation.fromValue = CGPoint(x: (view.bounds.width * 0.4), y: (view.bounds.height * 0.55))
    animation.toValue = CGPoint(x: (view.bounds.width * 0.4), y: ((view.bounds.height * 0.55) * CGFloat(value)))
    animation.duration = 0.5
    animation.autoreverses = true
    animation.repeatCount = Float.infinity
    
    layer.add(animation, forKey: nil)
  }
  
  func rightHandBuzzerTutorial(value: Float, view: UIView) {
    
    let animation = CABasicAnimation(keyPath: "position")
    animation.fromValue = CGPoint(x: (view.bounds.midX), y: (view.bounds.height * 0.45))
    animation.toValue = CGPoint(x: (view.bounds.midX), y: ((view.bounds.height * 0.45) * CGFloat(value)))
    animation.duration = 0.5
    animation.autoreverses = true
    animation.repeatCount = Float.infinity
    
    layer.add(animation, forKey: nil)
  }
  
  func shakeBuzzerTutorial() {
    let animation = CABasicAnimation(keyPath: "transform.rotation")
    animation.fromValue = Float.pi * 0.25
    animation.toValue = -Float.pi * 0.25
    animation.duration = 0.3
    animation.autoreverses = true
    animation.repeatCount = Float.infinity
    
    layer.add(animation, forKey: nil)
  }
  
  func blowBuzzerTutorial() {
    let animation = CABasicAnimation(keyPath: "opacity")
    animation.fromValue = 1
    animation.toValue = 0.1
    animation.duration = 0.3
    animation.autoreverses = true
    animation.repeatCount = Float.infinity
    
    layer.add(animation, forKey: nil)
  }
  
  
}

