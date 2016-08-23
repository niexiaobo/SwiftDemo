//
//  HZHguidePageControlViewController.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/29.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit

class HZHguidePageControlViewController: UIViewController {

    var index = 0
    var heading = ""
    var footer = ""
    var imageName = ""
    var HomeButhidden = true
    
    
    var pageCtrl: UIPageControl!
    var labelHeading: UILabel!
    var labelFooter: UILabel!
    var imageView: UIImageView!
    internal var goHomeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
    
        imageView = createImageView(CGRectMake(30, 75, ScreenWidth-60, 244), ImageName: imageName)
        self.view.addSubview(imageView)
        
        
        labelHeading = createLabel(CGRectMake(20, 30, ScreenWidth-40, 45), Font: 30, Text: heading)
        labelHeading.textAlignment = NSTextAlignment.Center
        labelHeading.textColor = UIColor.blackColor()
        self.view.addSubview(labelHeading)
        
        goHomeButton = createButton(CGRectMake((ScreenWidth - 100)/2.0, ScreenHeight-75-100, 100, 30), Text: "立即体验", ImageName: "", bgImageName: "", Target: self, Method: #selector(goHomeButtonClick))
        goHomeButton.hidden = HomeButhidden
        self.view.addSubview(goHomeButton)
        
        labelFooter = createLabel(CGRectMake(20, ScreenHeight-75, ScreenWidth-40, 30), Font: 17, Text: footer)
        labelFooter.textAlignment = NSTextAlignment.Center
        labelFooter.textColor = UIColor.blackColor()
        self.view.addSubview(labelFooter)
        
        pageCtrl = UIPageControl(frame: CGRectMake(20, ScreenHeight-40, ScreenWidth-40, 30))
        self.view.addSubview(pageCtrl)
        pageCtrl.backgroundColor = UIColor.clearColor()
        pageCtrl.numberOfPages = 3
        pageCtrl.currentPage = index
        pageCtrl.pageIndicatorTintColor = UIColor.grayColor()
        pageCtrl.currentPageIndicatorTintColor = UIColor.redColor()
    }
    func goHomeButtonClick(){
        
        ApplicationDelegate.goHomePage();

    }
    
    //创建View
    func createView (frame:CGRect) -> (UIView) {
        let view = UIView(frame: frame)
        return view;
    }
    
    //创建Label
    func createLabel (frame:CGRect, Font:CGFloat, Text:String) -> (UILabel) {
        let label = UILabel(frame: frame)
        label.text = Text
        label.font = UIFont.systemFontOfSize(Font)
        return label
    }
    
    //创建button
    func createButton (frame:CGRect, Text:String, ImageName:String, bgImageName:String, Target:AnyObject, Method:Selector) -> (UIButton) {
        let button = UIButton(type:.Custom)
        button.frame = frame
        button.setTitle(Text, forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        if ImageName.isEmpty {
            button.setImage(UIImage(named:ImageName), forState: UIControlState.Normal)
        }
        if bgImageName.isEmpty {
            button.setBackgroundImage(UIImage(named:bgImageName), forState: UIControlState.Normal)
        }
        button.addTarget(Target, action: Method, forControlEvents:UIControlEvents.TouchUpInside)
        return button
    }
    
    
    //创建imageView
    func createImageView (frame:CGRect, ImageName:String) -> (UIImageView) {
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named:ImageName)
        imageView.userInteractionEnabled = true
        return imageView
    }
    
    
    //创建UITextField
    func createTextField (frame:CGRect, placeholder:String, passWord:Bool, Font:CGFloat) -> (UITextField) {
        let textField = UITextField(frame: frame)
        //灰色提示框
        textField.placeholder = placeholder
        //文字对齐方式
        textField.textAlignment = NSTextAlignment.Left
        //是否加密
        textField.secureTextEntry = passWord
        //边框
        textField.borderStyle = UITextBorderStyle.RoundedRect
        //键盘类型
        textField.keyboardType = UIKeyboardType.EmailAddress
        //关闭首字母大写
        
        //清除按钮
        
        //        //左图片
        //        if leftImageView.isKindOfClass(UIImageView) {
        //            textField.leftView = leftImageView
        //            textField.leftViewMode = UITextFieldViewMode.Always
        //        }
        //        //右图片
        //        if rightImageView.isKindOfClass(UIImageView) {
        //            textField.rightView = rightImageView
        //            //编辑状态下一直存在
        //            textField.rightViewMode = UITextFieldViewMode.WhileEditing
        //        }
        //字体
        textField.font = UIFont.systemFontOfSize(Font)
        
        return textField
    }

    
}
