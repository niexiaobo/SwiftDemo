//
//  HZHHomeViewCell.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/14.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit

class HZHNewsSectionCell: UITableViewCell {
    
    internal var HomeCellImage: UIImageView!
    internal var titleLable: UILabel?
    internal var moreLable: UILabel?
    internal var moreButton: UIButton?
    override func awakeFromNib() {
        super.awakeFromNib()
        let imageH :CGFloat = 35
        var orgX :CGFloat = 15
        HomeCellImage = UIImageView(frame: CGRectMake(orgX, (imageH - 15)/2.0, 15, 15))
        
        self.addSubview(HomeCellImage!)
        orgX += 25
        titleLable = UILabel(frame: CGRectMake(orgX , 0, ScreenWidth - orgX - 100, imageH))
        moreLable = UILabel(frame: CGRectMake( ScreenWidth - 100, 0, 85, imageH))
        titleLable!.textColor = DarkColor51;
        titleLable!.font = UIFont.systemFontOfSize(15)
        moreLable!.textColor = DarkColor153;
        moreLable!.font = UIFont.systemFontOfSize(12)
        moreLable?.textAlignment = .Right
        
        moreButton = UIButton(frame: CGRectMake(ScreenWidth - 50 , 0, 50, imageH))
        
        self.addSubview(titleLable!)
        self.addSubview(HomeCellImage!)
        self.addSubview(moreLable!)
        self.addSubview(moreButton!)
    }
    
    class func settingCellWithTableView(tableView: UITableView) -> HZHNewsSectionCell {
        let identifier = "HZHNewsSectionCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? HZHNewsSectionCell
        if cell == nil {
            cell = HZHNewsSectionCell(style: .Default, reuseIdentifier: identifier)
            cell!.accessoryType = UITableViewCellAccessoryType.None
            cell!.selectionStyle = .None
            cell?.awakeFromNib()
        }
        
        return cell!
    }
    
}
