//
//  HZHMallTableViewCell.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/7/1.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit
import YYWebImage

class HZHMallTableViewCell: UITableViewCell {
    //
    var cellHeight: CGFloat = 14 + (ScreenWidth - 28)*(122.0 / 286.0)  //286 152
    
    var postModel: HZHMatchArticleListModel? {
        didSet {
            // 进度圈半径
            let radius: CGFloat = 30.0
            let progressView = HZHMatchProgressView(frame: CGRect(x: ScreenWidth / 2 - radius, y: cellHeight / 2 - radius, width: radius * 2, height: radius * 2))
            progressView.radius = radius
            
            
            
            iconView.yy_setImageWithURL(NSURL(string: postModel!.titlepic!), placeholder: UIImage.init(named: "zhanwei1"), options: YYWebImageOptions.SetImageWithFadeAnimation, progress: { (receivedSize, expectedSize) in
                self.contentView.addSubview(progressView)
                progressView.progress = CGFloat(receivedSize) / CGFloat(expectedSize)
                }, transform: { (image, url) -> UIImage! in
                    return image
            }) { (image, url, type, stage, error) in
                progressView.removeFromSuperview()
            }
            
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.accessoryType = UITableViewCellAccessoryType.None
        self.selectionStyle = .None
        self.backgroundColor = UIColor.clearColor()
        
        // 准备uI
        prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     准备UI
     */
    private func prepareUI() {
        
        contentView.addSubview(self.backGView)
        self.backGView.addSubview(self.iconView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let model = postModel {
            var rect = bounds
            rect.origin.y += model.offsetY
            //            iconView.frame = rect
        }
        
    }
    
    func cellOffset() -> CGFloat {
        let centerToWindow = convertRect(bounds, toView: window)
        let centerY = CGRectGetMidY(centerToWindow)
        let windowCenter = window!.center
        let cellOffsetY = centerY - windowCenter.y
        let offsetDig = cellOffsetY / ScreenHeight * 3
        postModel!.offsetY = -offsetDig * (ScreenHeight / 1.7 - self.cellHeight) / 6
        iconView.transform = CGAffineTransformMakeTranslation(0, postModel!.offsetY)
        return postModel!.offsetY
    }
    
    // MARK: - 懒加载
    private lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        //        iconView.contentMode = .ScaleAspectFill
        iconView.frame = CGRect(x: 0, y: 0, width: self.backGView.width, height: self.backGView.height)
        return iconView
    }()
    
    private lazy var backGView: UIView = {
        let backGView = UIView(frame: CGRect(x: 14, y: 14, width: ScreenWidth - 28, height: self.cellHeight - 14))
        backGView.backgroundColor = UIColor.whiteColor()
        backGView.layer.borderColor = DarkColor236.CGColor
        backGView.layer.borderWidth = 1
        backGView.layer.masksToBounds = true
        return backGView
    }()
    
    
}
