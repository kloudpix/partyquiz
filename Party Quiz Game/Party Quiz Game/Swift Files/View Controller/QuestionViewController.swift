//
//  MainViewController.swift
//  Party Quiz Game
//
//  Created by Giovanni Frate on 12/02/18.
//  Copyright © 2018 Abusive Designers. All rights reserved.
//

import UIKit
import CoreData

class QuestionViewController: UIViewController {
  
  // - MARK: 1: Variables and Outlets declaration
  @IBOutlet weak var buzzerView: UIView!
  @IBOutlet weak var progressControllerView: UIView!
  @IBOutlet var questionOutlet: UILabel!
  
  @IBOutlet var buttonAnswerOne: UIButton!
  @IBOutlet var buttonAnswerTwo: UIButton!
  @IBOutlet var buttonAnswerThree: UIButton!
  @IBOutlet var buttonAnswerFour: UIButton!
  
  let backgoundBase = UIColor(red: 67/255, green: 59/255, blue: 240/255, alpha: 1)
  let backgoundLilla = UIColor(red: 189/255, green: 16/255, blue: 224/255, alpha: 1)
  let background2 = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
  let background3 = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
  let background4 = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
  // black is good
  // orange is good
  var index = 0
  // - MARK: 2: ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = backgoundBase
    let questionOutletInitPoint = questionOutlet.frame.origin
    setAnswersQuestion()
    loadProgressView()
    randomBuzzers()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    if PeerManager.shared.host{
      PeerManager.shared.sendQuestion()
      self.questionOutlet.text = PeerManager.shared.convertToString(data: PeerManager.shared.arrayQuestion[0])
        self.buttonAnswerOne.setTitle(PeerManager.shared.convertToString(data: PeerManager.shared.arrayQuestion[1]), for: UIControlState.normal)
        self.buttonAnswerTwo.setTitle(PeerManager.shared.convertToString(data: PeerManager.shared.arrayQuestion[2]), for: UIControlState.normal)
        self.buttonAnswerThree.setTitle(PeerManager.shared.convertToString(data: PeerManager.shared.arrayQuestion[3]), for: UIControlState.normal)
        self.buttonAnswerFour.setTitle(PeerManager.shared.convertToString(data: PeerManager.shared.arrayQuestion[4]), for: UIControlState.normal)
      
    }
    else{
      
      self.questionOutlet.text = PeerManager.shared.question[0]
      self.buttonAnswerOne.setTitle(PeerManager.shared.question[1], for: UIControlState.normal)
      self.buttonAnswerTwo.setTitle(PeerManager.shared.question[2], for: UIControlState.normal)
      self.buttonAnswerThree.setTitle(PeerManager.shared.question[3], for: UIControlState.normal)
      self.buttonAnswerFour.setTitle(PeerManager.shared.question[4], for: UIControlState.normal)
    }
    
  }

  
  // - MARK: 3: Method that loads the progress view
  func loadProgressView() {
    if let progressView = Bundle.main.loadNibNamed("ProgressView", owner: self, options: nil)?.first as? ProgressView {
      progressControllerView.addSubview(progressView)
      progressView.manageProgress()
      progressView.frame = progressControllerView.bounds
    }
  }

  // - MARK: 4: Method that generates random buzzers
  func randomBuzzers() {
    index = 0 //Int(arc4random_uniform(4))
    if index == 0 {
      if let oneBuzzer = Bundle.main.loadNibNamed("OneBuzzer", owner: self, options: nil)?.first as? OneBuzzer {
        buzzerView.addSubview(oneBuzzer)
        oneBuzzer.loadPopUp(view: buzzerView)
        oneBuzzer.setBuzzer()
        oneBuzzer.frame = buzzerView.bounds
        changeBackgroundColor(finalColor: UIColor.orange)
      }
    } else if index == 1 {
      if let twoBuzzers = Bundle.main.loadNibNamed("TwoBuzzers", owner: self, options: nil)?.first as? TwoBuzzers {
        buzzerView.addSubview(twoBuzzers)
        twoBuzzers.loadPopUp(view: buzzerView)
        twoBuzzers.setBuzzers()
        twoBuzzers.frame = buzzerView.bounds
        changeBackgroundColor(finalColor: UIColor.red)
      }
    } else if index == 2 {
      if let shakeBuzzer = Bundle.main.loadNibNamed("ShakeBuzzer", owner: self, options: nil)?.first as? ShakeBuzzer {
        buzzerView.addSubview(shakeBuzzer)
        shakeBuzzer.loadPopUp()
        shakeBuzzer.setRoundedView()
        shakeBuzzer.setRoundedLabel()
        shakeBuzzer.beginShaking()
        shakeBuzzer.frame = buzzerView.bounds
        changeBackgroundColor(finalColor: UIColor.black)
      }
    } else {
      if let blowBuzzer = Bundle.main.loadNibNamed("BlowBuzzer", owner: self, options: nil)?.first as? BlowBuzzer {
        buzzerView.addSubview(blowBuzzer)
        blowBuzzer.loadPopUp()
        blowBuzzer.setRoundedView()
        blowBuzzer.startBlowing()
        blowBuzzer.frame = buzzerView.bounds
        changeBackgroundColor(finalColor: backgoundLilla)
      }
    }
  }
  

  func setAnswersQuestion() {
    questionOutlet.layer.cornerRadius = 25.0
    questionOutlet.clipsToBounds = true
    questionOutlet.layer.borderWidth = 6.0
    
    buttonAnswerOne.layer.cornerRadius = 25
    buttonAnswerOne.layer.borderWidth = 6.0
    buttonAnswerTwo.layer.cornerRadius = 25
    buttonAnswerTwo.layer.borderWidth = 6.0
    buttonAnswerThree.layer.cornerRadius = 25
    buttonAnswerThree.layer.borderWidth = 6.0
    buttonAnswerFour.layer.cornerRadius = 25
    buttonAnswerFour.layer.borderWidth = 6.0
    
  }
  
  @IBAction func buttonAction(_ sender: UIButton) {
    randomBuzzers()
    loadProgressView()
  }
  
  func changeBackgroundColor(finalColor: UIColor) {
    view.changeBackgroundColor(initColor: view.backgroundColor!, finalColor: finalColor)
    Singleton.shared.delayWithSeconds(1.8, completion: {
      self.view.backgroundColor = finalColor
    })
  }
  
}
