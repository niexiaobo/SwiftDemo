//
//  HZHNewsOnePicCell.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/17.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit

class HZHNewsOnePicCell: UITableViewCell {
        
        internal var imageLeft: UIImageView!
        internal var titleLabel: UILabel?
        internal var detailLabel: UILabel?
        internal var lineTop: UIView?
        internal var lineBoot: UIView?
    
    
        override func awakeFromNib() {
            super.awakeFromNib()
            
            var orgX :CGFloat = 10
            var orgY :CGFloat = 15
            
            //间隔线
            lineTop=UIView(frame: CGRectMake(0,0, ScreenWidth, 1))
            lineTop!.backgroundColor = DarkColor236;
            self.addSubview(lineTop!)
            
            imageLeft = UIImageView(frame: CGRectMake(orgX, orgY, 97, 72))
            
            self.addSubview(imageLeft!)
            orgX += 97 + 11
            titleLabel = UILabel(frame: CGRectMake(orgX, orgY, ScreenWidth-15-orgX, 21))
            titleLabel!.textColor = DarkColor51;
            titleLabel!.font = UIFont.systemFontOfSize(17)
            self.addSubview(titleLabel!)
            
            orgY += 31
            
            detailLabel = UILabel(frame: CGRectMake(orgX, orgY, ScreenWidth-15-orgX, 40))
            detailLabel!.textColor = UIColor.init(red: 148.0/255.0, green: 148.0/255.0, blue: 148.0/255.0, alpha: 1.0);
            detailLabel!.font = UIFont.systemFontOfSize(14)
            detailLabel?.numberOfLines = 2
            self.addSubview(detailLabel!)
            
            //间隔线
            lineBoot=UIView(frame: CGRectMake(0,102 - 1 , ScreenWidth, 1))
            lineBoot!.backgroundColor = DarkColor236;
            self.addSubview(lineBoot!)
            
            
        }
        
        class func settingCellWithTableView(tableView: UITableView) -> HZHNewsOnePicCell {
            let identifier = "HZHNewsOnePicCell"
            
            var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? HZHNewsOnePicCell
            if cell == nil {
                cell = HZHNewsOnePicCell(style: .Default, reuseIdentifier: identifier)
                cell!.accessoryType = UITableViewCellAccessoryType.None
                cell!.selectionStyle = .None
                cell?.awakeFromNib()
            }
            
            return cell!
        }
    
    
        var postModel: HZHHomeNewsJsonModel? {
            didSet {
               titleLabel?.text = postModel?.news_title
               detailLabel?.text = postModel?.news_abstract
               imageLeft.sd_setImageWithURL(NSURL(string: postModel!.preview_image)!, placeholderImage: UIImage(named: "zhanwei1")!)
            }
        }
    
    
}
