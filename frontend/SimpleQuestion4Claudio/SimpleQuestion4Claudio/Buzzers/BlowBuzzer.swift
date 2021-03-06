//
//  BlowBuzzer.swift
//  SimpleBuzzer
//
//  Created by Giovanni Frate on 15/02/18.
//  Copyright © 2018 Giovanni Frate. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import CoreAudio

class BlowBuzzer: UIView {

  var recorder: AVAudioRecorder!
  var levelTimer = Timer()
  var index = 0
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var viewOutlet: UIView!
  
  func startBlowing() {
    let documents = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0])
    let url = documents.appendingPathComponent("record.caf")
    let recordSettings: [String: Any] = [
      AVFormatIDKey:              kAudioFormatAppleIMA4,
      AVSampleRateKey:            44100.0,
      AVNumberOfChannelsKey:      2,
      AVEncoderBitRateKey:        12800,
      AVLinearPCMBitDepthKey:     16,
      AVEncoderAudioQualityKey:   AVAudioQuality.max.rawValue
    ]
    let audioSession = AVAudioSession.sharedInstance()
    do {
      try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
      try audioSession.setActive(true)
      try recorder = AVAudioRecorder(url:url, settings: recordSettings)
    } catch {
      return
    }
    
    recorder.prepareToRecord()
    recorder.isMeteringEnabled = true
    recorder.record()
    
    levelTimer = Timer.scheduledTimer(timeInterval: 0.00009, target: self, selector: #selector(detectData), userInfo: nil, repeats: true)
    
    label.text = "0"
  }
  
  @objc func detectData() {
    recorder.updateMeters()
    let level = recorder.averagePower(forChannel: 0)
    if index < 1000 {
      if level > -10 {
        index += 1
        label.text = ("\(index / 10)")
      }
    } else if index == 1000 {
      label.text = "Done!"
      recorder.stop()
      levelTimer.invalidate()
    }
  }
  
  func setRoundedView() {
    viewOutlet.layer.cornerRadius = 50
    viewOutlet.layer.borderColor = UIColor.black.cgColor
    viewOutlet.layer.borderWidth = 1
  }

}
