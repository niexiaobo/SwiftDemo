//
//  NewsThreePicCell.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/17.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit
let ThreePicCellHeight = (79.0/112.0)*((ScreenWidth-40.0)/3.0)+16*3+21
class NewsThreePicCell: UITableViewCell {
    
    internal var imageLeft: UIImageView!
    internal var imageMid: UIImageView!
    internal var imageRight: UIImageView!
    internal var titleLabel: UILabel?
    internal var detailLabel: UILabel?
    internal var lineTop: UIView?
    internal var lineBoot: UIView?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        var orgX :CGFloat = 10
        var orgY :CGFloat = 15
        let imgWidth = (ScreenWidth-40.0)/3.0
        let imgHeight = (79.0/112.0)*imgWidth
        //间隔线
        lineTop=UIView(frame: CGRectMake(0,0, ScreenWidth, 1))
        lineTop!.backgroundColor = DarkColor236;
        self.addSubview(lineTop!)
        
        titleLabel = UILabel(frame: CGRectMake(orgX, orgY, ScreenWidth-15-orgX, 21))
        titleLabel!.textColor = DarkColor51;
        titleLabel!.font = UIFont.systemFontOfSize(17)
        self.addSubview(titleLabel!)

        orgY += 21+16
        
        imageLeft = UIImageView(frame: CGRectMake(orgX, orgY, imgWidth, imgHeight))
        self.addSubview(imageLeft!)
        orgX += imgWidth + 10;
        
        imageMid = UIImageView(frame: CGRectMake(orgX, orgY, imgWidth, imgHeight))
        self.addSubview(imageMid!)
        orgX += imgWidth + 10;
        
        imageRight = UIImageView(frame: CGRectMake(orgX, orgY, imgWidth, imgHeight))
        self.addSubview(imageRight!)
        
        //间隔线
        lineBoot=UIView(frame: CGRectMake(0,ThreePicCellHeight - 1 , ScreenWidth, 1))
        lineBoot!.backgroundColor = DarkColor236;
        self.addSubview(lineBoot!)
        
        
    }
    
    class func settingCellWithTableView(tableView: UITableView) -> NewsThreePicCell {
        let identifier = "NewsThreePicCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? NewsThreePicCell
        if cell == nil {
            cell = NewsThreePicCell(style: .Default, reuseIdentifier: identifier)
            cell!.accessoryType = UITableViewCellAccessoryType.None
            cell!.selectionStyle = .None
            cell?.awakeFromNib()
        }
        
        return cell!
    }
    
    
    var postModel: HZHHomeNewsJsonModel? {
        didSet {
            titleLabel?.text = postModel?.news_title
            
            imageLeft.sd_setImageWithURL(NSURL(string: postModel!.preview_image)!, placeholderImage: UIImage(named: "zhanwei1")!)
            imageMid.sd_setImageWithURL(NSURL(string: postModel!.preview_image)!, placeholderImage: UIImage(named: "zhanwei1")!)
            imageRight.sd_setImageWithURL(NSURL(string: postModel!.preview_image)!, placeholderImage: UIImage(named: "zhanwei1")!)
            
        }
    }
    
    
}

