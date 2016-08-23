//
//  HZHImageLabelView.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/17.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit
import Kingfisher

class HZHImageLabelView: UIView {

    var titleLable: UILabel?
    var describLable: UILabel?
    var imageView: UIImageView?
    var selectBut: UIButton?
    var delegate: ImageLabelDelegate?
    override func drawRect(rect: CGRect) {
        
        imageView = UIImageView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height-43))
        titleLable = UILabel(frame: CGRectMake(0, frame.size.height-32, frame.size.width, 15))
        describLable = UILabel(frame: CGRectMake(0, frame.size.height-10, frame.size.width, 12))
        titleLable!.textColor = DarkColor51;
        titleLable!.font = UIFont.systemFontOfSize(15)
        describLable!.textColor = DarkColor153;
        describLable!.font = UIFont.systemFontOfSize(12)
        
        selectBut = UIButton(frame: self.bounds)
        selectBut!.addTarget(self,action:#selector(tapped(_:)),forControlEvents:.TouchUpInside)
        self.addSubview(titleLable!)
        self.addSubview(imageView!)
        self.addSubview(describLable!)
        self.addSubview(selectBut!)
        self.backgroundColor = UIColor.whiteColor()
    }
    internal var postModel: HZHHomeNewsJsonModel? {
        didSet {
        titleLable!.text = postModel?.news_title
        describLable!.text = postModel?.news_abstract
        
//         imageView!.kf_setImageWithURL(NSURL(string: "http://pic3.nipic.com/20090612/2012851_142953053_2.jpg")!, placeholderImage: UIImage(named: "zhanwei1")!)

            
             imageView!.kf_setImageWithURL(NSURL(string: postModel!.preview_image)!, placeholderImage: UIImage(named: "zhanwei1")!)

        }
    }
    func tapped(button:UIButton){
        print("self" , self.tag)
        self.delegate?.clickCurrentImage!(self.tag)
    }
}
//MARK:- Protocol Methods
@objc protocol ImageLabelDelegate {
    optional func clickCurrentImage(currentIndxe: Int)
}
