//
//  ViewController.swift
//  DRWaveProgress
//
//  Created by xqzh on 16/11/14.
//  Copyright © 2016年 xqzh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let wave = DRWaveBallProgressView(frame: CGRect(x: 90, y: 90, width: 250, height: 250))
  var i = 0.0
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    let wave = DRBezierWaveView(frame: CGRect(x: 100, y: 100, width: 375, height: 375))
//    wave.speed      = 2
//    wave.waveHeight = 10.0
//    wave.waveWidth  = 375.0
    
    wave.progress = 0.0
//    wave.layer.cornerRadius = 375 / 2.0
//    wave.layer.masksToBounds = true
    wave.image = UIImage(named: "bg_ball")
    wave.contentMode = .scaleToFill
    wave.backgroundColor = UIColor.blue
    
    
    wave.isUserInteractionEnabled = true
    self.view.addSubview(wave)
    
    
    
    let timer = Timer(timeInterval: 1, target: self, selector: #selector(time), userInfo: nil, repeats: true)
    let run = RunLoop.current
    run.add(timer, forMode: RunLoopMode.commonModes)
    timer.fire()
    
//    let link = CADisplayLink(target: self, selector: #selector(time))
//    link.add(to: RunLoop.main, forMode: .commonModes)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func time() {
    i += 0.05
//    UIView.animate(withDuration: 1) {
    
//    }
//    let anim = CABasicAnimation(keyPath: "position")
//    anim.fromValue = wave.progress
    self.wave.progress = CGFloat(self.i)
    
//    anim.toValue = wave.progress
//    anim.duration = 1.0
//    wave.layer.add(anim, forKey: "position")
    
  }

}

