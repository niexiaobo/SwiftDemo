//
//  HZHHeadRaceView.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/14.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit

class HZHHeadRaceView: UIView {

    internal var nameLabel: UILabel!
    internal var numberLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    private func setUp() {
        self.backgroundColor = UIColor.clearColor()
        
        var orgY :CGFloat = 0.0
        let orgX :CGFloat = 0.0
        let loginLabelHeight: CGFloat = 24
        // 号码
        numberLabel = UILabel(frame: CGRectMake(orgX, orgY, ScreenWidth / 3.0, loginLabelHeight))
        numberLabel.textAlignment = .Center
        numberLabel.text = ""
        numberLabel.font = UIFont.systemFontOfSize(18)
        numberLabel.textColor = UIColor(red: CGFloat(51.0) / 255.0, green: CGFloat(51.0) / 255.0, blue: CGFloat(51.0) / 255.0, alpha: 1)
        self.addSubview(numberLabel)
        
        orgY += 24.0
        // 名称
        
        nameLabel = UILabel(frame: CGRectMake(orgX, orgY, ScreenWidth / 3.0, loginLabelHeight))
        nameLabel.textAlignment = .Center
        nameLabel.text = ""
        nameLabel.font = UIFont.systemFontOfSize(13)
        nameLabel.textColor = UIColor(red: CGFloat(153.0) / 255.0, green: CGFloat(153.0) / 255.0, blue: CGFloat(153.0) / 255.0, alpha: 1)
        self.addSubview(nameLabel)
        
    }
    
}
