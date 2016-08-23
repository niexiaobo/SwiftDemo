//
//  HZHtableHeadView.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/7/1.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit

class HZHtableHeadView: UIView {

    internal var leftButton: UIButton?
    internal var rightButton: UIButton?
    internal var loginButton: UIButton?
    internal var loginImageV: UIImageView?
    var imageH = ScreenWidth * (150.0 / 300.0)
    var ButtonH: CGFloat = 60.0
    override func drawRect(rect: CGRect) {
        // Drawing code
        self.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height:self.imageH + self.ButtonH)
        
        self.addSubview(tableHeadView)
    }
    private lazy var tableHeadView: UIView = {
        let tableHeadView = UIView(frame: self.bounds)
        tableHeadView.backgroundColor = UIColor.whiteColor()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height:self.imageH))
        imageView.image = UIImage.init(named: "组-9")
        tableHeadView.addSubview(imageView)
        
        //头像
        let imageHW: CGFloat = 60.0
        let loginImageV = UIImageView(frame: CGRect(x: (ScreenWidth - imageHW)/2.0, y: 74, width: imageHW, height: imageHW))
        loginImageV.image = UIImage.init(named: "cm-clublogo-default")
        tableHeadView.addSubview(loginImageV)
        
        //登录按钮
        let loginButtonHW: CGFloat = 90.0
        self.loginButton = UIButton(frame: CGRectMake((ScreenWidth - loginButtonHW)/2.0 , loginImageV.y + loginImageV.height + 15.0, loginButtonHW, 30))
        self.loginButton!.setTitle("登录/注册", forState: UIControlState.Normal)
        self.loginButton!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.loginButton!.backgroundColor = UIColor.init(red: 201.0/255.0, green: 52.0/255.0, blue: 21.0/255.0, alpha: 1.0)
        tableHeadView.addSubview(self.loginButton!)
        
        self.leftButton = UIButton(frame: CGRectMake( 0 , self.imageH, ScreenWidth/2.0, self.ButtonH))
        self.rightButton = UIButton(frame: CGRectMake(ScreenWidth/2.0 , self.imageH, ScreenWidth/2.0, self.ButtonH))
        self.leftButton!.setTitle("俱乐部成员", forState: UIControlState.Normal)
        self.leftButton!.setTitleColor(DarkColor153, forState: UIControlState.Normal)
        self.rightButton!.setTitle("活动", forState: UIControlState.Normal)
        self.rightButton!.setTitleColor(DarkColor153, forState: UIControlState.Normal)
        tableHeadView.addSubview(self.leftButton!)
        tableHeadView.addSubview(self.rightButton!)
        
        return tableHeadView
    }()
}
