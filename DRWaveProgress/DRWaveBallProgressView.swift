//
//  DRWaveBallProgressView.swift
//  DRWaveProgress
//
//  Created by xqzh on 16/11/16.
//  Copyright © 2016年 xqzh. All rights reserved.
//

import UIKit

class DRWaveBallProgressView: UIImageView {

  var waveball:DRBezierWaveView
  var progress:CGFloat {
    didSet {
      waveball.progress = progress
    }
  }
  
  override init(frame: CGRect) {
    let rect = CGRect(x: 22, y: 20, width: frame.size.width-45, height: frame.size.height-45)
    waveball = DRBezierWaveView(frame: rect)
    waveball.backgroundColor = UIColor.clear
    progress = 0.0
    super.init(frame: frame)
    self.addSubview(waveball)
  }
  
  convenience init(frame: CGRect, backImage:UIImage) {
    self.init(frame:frame)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
