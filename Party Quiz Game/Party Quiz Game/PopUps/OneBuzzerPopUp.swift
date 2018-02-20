//
//  OneBuzzerPopUp.swift
//  SimpleBuzzer
//
//  Created by Giovanni Frate on 16/02/18.
//  Copyright © 2018 Giovanni Frate. All rights reserved.
//

import UIKit

class OneBuzzerPopUp: UIView {
  
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var okOutlet: UIButton!
  @IBOutlet weak var hand: UIImageView!
  @IBOutlet weak var oneBuzzer: UIImageView!
  
  func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
      completion()
    }
  }
  
  func setViewElements(view: UIView) {
    label.layer.cornerRadius = 25.0
    label.layer.borderColor = UIColor.lightGray.cgColor
    label.layer.borderWidth = 1.0
    label.clipsToBounds = true
    okOutlet.layer.cornerRadius = 15.0
    okOutlet.layer.borderColor = UIColor.black.cgColor
    okOutlet.layer.borderWidth = 1.5
    hand.oneBuzzerTutorial(value: 0.8, view: view)
  }
  
  @IBAction func okAction(_ sender: UIButton) {
    self.tutorialDismiss(view: self)
    delayWithSeconds(0.1) {
      self.removeFromSuperview()
    }
    
  }
  
}