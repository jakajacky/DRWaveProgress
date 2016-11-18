//
//  DRWaveBallProgressView.swift
//  DRWaveProgress
//
//  Created by xqzh on 16/11/16.
//  Copyright © 2016年 xqzh. All rights reserved.
//

import UIKit

class DRWaveBallProgressView: UIImageView {

  // 波浪球
  var waveball:DRBezierWaveView
  // 进度
  var progress:Double {
    didSet {
      print("---\(progress)")
      // 浮点型数值 可以使用<、>比较大小，但是不能直接使用=判断相等，也就不能使用<= 、>=
      if progress < 1.0 || fabs(progress - 1.0) < 0.0000001 {
        print("+--\(progress)")
        waveball.progress = CGFloat(progress)
        progLabel.text = "\(progress*100)%"
      }
    }
  }
  
  // 进度数值
  var progLabel:UILabel
  
  // 文字大小 默认48
  var textSize:CGFloat! = 48
  // 文字颜色 默认白色
  var textColor:UIColor! = UIColor.white
  override init(frame: CGRect) {
    
    var rect = CGRect(x: 22, y: 20, width: frame.size.width-45, height: frame.size.height-45)
    waveball = DRBezierWaveView(frame: rect)
    waveball.backgroundColor = UIColor.clear
    
    progress = 0.0
    
    rect = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    progLabel = UILabel(frame: rect)
    
    super.init(frame: frame)
    self.image = UIImage(named: "bg_ball")
    progLabel.center = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)
    progLabel.textAlignment = .center
    progLabel.font = UIFont(name: "Arial Rounded MT Bold", size: textSize)
    progLabel.textColor = textColor
    
    progLabel.text = "\(progress*100)%"
    self.addSubview(waveball)
    self.addSubview(progLabel)
  }
  
  convenience init(frame: CGRect, backImage:UIImage) {
    self.init(frame:frame)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
