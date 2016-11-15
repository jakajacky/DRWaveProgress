//
//  DRBezierWaveView.swift
//  BezierWave
//
//  Created by xqzh on 16/11/2.
//  Copyright © 2016年 xqzh. All rights reserved.
//

import UIKit

class DRBezierWaveView: UIView {
  
  // 进度（也就是水柱的高度）
  var progress  :CGFloat = 0 //{ // 属性观察器
//    willSet {
//      UIView.animate(withDuration: 1) { 
//        guard let v = self.bezierPath else {
//          return
//        }
//        self.bezierPath.move(to: CGPoint(x: 0, y: newValue))
//      }
//    }
//  }
  
  // 波浪属性
  var offset    :CGFloat = 0     // 偏移量
  var speed     :CGFloat = 2     // 移动速度
  var waveHeight:CGFloat = 10.0  // 波浪高度
  var waveWidth :CGFloat = 375.0 // 波浪宽度
  
  var width     :CGFloat!    // 控件宽度
  var height    :CGFloat!    // 控件高度
  
  var backg     :CAShapeLayer!
  var backg_    :CAShapeLayer!
  var bezierPath:UIBezierPath!
  
  
  
  override func draw(_ rect: CGRect) {
    width  = self.frame.size.width
    height = self.frame.size.height
      
    self.layer.cornerRadius  = width / 2.0
    self.layer.masksToBounds = true
    
    // 增加layer
    backg = CAShapeLayer()
    backg.lineWidth   = 1
    backg.strokeColor = UIColor.clear.cgColor
    backg.fillColor   = UIColor.clear.cgColor
    backg.opacity     = 0.5
    
    // 增加layer1
    backg_ = CAShapeLayer()
    backg_.lineWidth   = 1
    backg_.strokeColor = UIColor.clear.cgColor
    backg_.fillColor   = UIColor.clear.cgColor
    backg_.opacity     = 0.5
    
    // 增加贝塞尔曲线
    bezierPath = UIBezierPath()
    
    self.layer.addSublayer(backg)
    self.layer.addSublayer(backg_)
    
    // 定时
    let link = CADisplayLink(target: self, selector: #selector(animation))
    link.add(to: RunLoop.main, forMode: .commonModes)
  }

  func animation() {
    // 第一个layer
    bezierPath.removeAllPoints()
    offset += speed
    
    /*var startY = Double(waveHeight)*Double(sinf(Float(M_PI*Double(offset)/Double(375.0))))*/
    
    let beforePath = bezierPath
    
    bezierPath.move(to: CGPoint(x: 0, y: height)) // 设置起点
    for i in 0...Int(waveWidth)-1 { // 终点和control点不用设置，通过下面的正弦函数计算，依靠addLine手动设置
      
      let a = 2.5*M_PI*Double(i)/Double(waveWidth)
      let b = Double(offset)*M_PI/Double(waveWidth)
      let y = Double(1.1)*Double(waveHeight)*Double(sinf(Float(a+b))) + Double((1-progress/waveWidth)*height)
      bezierPath.addLine(to: CGPoint(x: CGFloat(i), y: CGFloat(y)))
    }
    bezierPath.addLine(to: CGPoint(x: waveWidth, y: height)) // 设置终点
    
    let anim = CABasicAnimation(keyPath: "path")
    anim.fromValue = beforePath
    anim.toValue = bezierPath
    anim.duration = 0.3
    
    backg.add(anim, forKey: "path")
    backg.path = bezierPath.cgPath

    backg.fillColor = UIColor.lightGray.cgColor
    backg.opacity   = 0.5
    backg.path      = bezierPath.cgPath
    
    // 第二个layer
    bezierPath.removeAllPoints()
    offset += 2
    
    /*let startY2 = Double(waveHeight)*Double(sinf(Float(M_PI*Double(offset)/375.0)) + Float(M_PI/4));*/
    
    bezierPath.move(to: CGPoint(x: 0, y: height))
    
    for i in 0...Int(waveWidth)-1 {
      
      let a = 2.5*M_PI*Double(i)/Double(waveWidth)
      let b = Double(3*offset)*M_PI/Double(waveWidth)
      let y = Double(10.0)*Double(sinf(Float(a+b+M_PI/4))) + Double((1-progress)*height)
      
      bezierPath.addLine(to: CGPoint(x: CGFloat(i), y: CGFloat(y)))
    }
    bezierPath.addLine(to: CGPoint(x: waveWidth, y: height))
    
    let anim1 = CABasicAnimation(keyPath: "path")
    anim1.toValue = bezierPath
    anim1.duration = 0.3
    
    backg_.add(anim1, forKey: "path")
    backg_.path = bezierPath.cgPath
    
    backg_.fillColor = UIColor.lightGray.cgColor
    backg_.opacity   = 0.5
    backg_.path      = bezierPath.cgPath

  }
  
}
