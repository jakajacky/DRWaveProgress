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
  var i:Double = 0.0
  override func viewDidLoad() {
    super.viewDidLoad()
    
    wave.progress = 0.0
    
//    var te:CGFloat = 0.0
//    te += 0.05
//    if te == 1.05 {
//      print("-----")
//    }
    
    
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

    self.wave.progress = Double(self.i)
  }

}

