//
//  UIButton+nxb.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/7/4.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {

    struct ControlState {
        let Normal = UIControlState.Normal //普通状态
        let Highlighted = UIControlState.Highlighted
        let Disabled = UIControlState.Disabled
        let Selected = UIControlState.Selected
    }
    func setFrameB(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat){
        //设置按钮位置和大小
        self.frame=CGRectMake(10, 150, 100, 30)
    }
    func setTitleAndColorB(Title: String , Color: UIColor, State: UIControlState) {
        self.setTitle(Title , forState:State)//文字
        self.setTitleColor(Color,forState: State) //文字的颜色
    }
    func setBackgroundColorB(Color: UIColor) {
        self.backgroundColor = Color
    }
    func setImageB(imageName: String , State: UIControlState) {
        self.setImage(UIImage(named:imageName),
                    forState:State)  //设置图标
        
    }
    func setBackgroundImageB(imageName: String , State: UIControlState) {
        self.setBackgroundImage(UIImage(named:imageName),
                      forState:State)  //设置图标
        
    }
    func setAdjustsImageB() {
        self.adjustsImageWhenHighlighted = false //false:使触摸模式下按钮也不会变暗
        self.adjustsImageWhenDisabled = false //false:使禁用模式下按钮也不会变暗
    }
    //不传递触摸对象（即点击的按钮）
    func addTargetB1(target: AnyObject?, action: Selector, forControlEvents controlEvents: UIControlEvents) {
        
        self.addTarget(self,action:#selector(tappedA),forControlEvents:.TouchUpInside)
        
    }
    func tappedA(){
        print("不传递触摸对象")
    }

    //传递触摸对象（即点击的按钮），需要在定义action参数时，方法名称后面带上冒号
    func addTargetB2(target: AnyObject?, action: Selector, forControlEvents controlEvents: UIControlEvents) {
        self.addTarget(self,action:#selector(tappedB(_:)),forControlEvents:.TouchUpInside)
    }
    func tappedB(button:UIButton){
        print("传递触摸对象UIButton")
    }
    //按钮 label 属性
    func setTitleLabelB() {
        self.titleLabel!.minimumScaleFactor = 0.3
        self.titleLabel!.numberOfLines = 0
        self.titleLabel!.adjustsFontSizeToFitWidth = true
        self.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        self.contentEdgeInsets = UIEdgeInsets(top: 3.0,left: 3.0,bottom: 3.0,right: 3.0)

        
    }
    //设置字体大小
    func setTitleFontB(Font: CGFloat){
         self.titleLabel?.font = UIFont.systemFontOfSize(Font)
    }
    //设置UIButton圆角
    func setRadiusB(Radius: CGFloat){
        self.layer.cornerRadius = Radius
    }
    //设置背景图片为圆角（因为我们直接设置UIButton圆角时，图片不会变为圆角）
    func setImageRadiusB(Radius: CGFloat){
        self.imageView?.layer.cornerRadius = Radius
    }
    
    //调整UIButton 文字 位置
    func setTitleEdgeInsetsB(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat){
        //方向为逆时针方向，上、左、下、右依次去设置的
        self.titleEdgeInsets = UIEdgeInsetsMake(top , left , bottom , right )
    }
    //调整UIButton图片 位置
    func setImageEdgeInsetsB(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat){
        //方向为逆时针方向，上、左、下、右依次去设置的
        self.imageEdgeInsets = UIEdgeInsetsMake(top , left , bottom , right )
    }
    
}
