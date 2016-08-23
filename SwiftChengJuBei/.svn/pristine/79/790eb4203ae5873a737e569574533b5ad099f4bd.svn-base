//
//  HZHMeHeadCell.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/14.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit
import Foundation

class HZHMeHeadCell: UITableViewCell {
    internal var nameLabel: UILabel!
    internal var phoneLabel: UILabel!
    private var iconView: IconView?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        var orgY :CGFloat = 14.0
        var orgX :CGFloat = 14.0
        let cellH :CGFloat = 98.0
        let imageH :CGFloat = 75.0
        // 添加iconImageView
        iconView = IconView(frame: CGRectMake(orgX, (cellH-imageH)/2.0, imageH, imageH))
        iconView!.delegate = self
//        iconView!.center = CGPointMake(0, 0)
        self.addSubview(iconView!)
        
        orgY += 7.0
        orgX += imageH + 11
        // 名称
        let loginLabelHeight: CGFloat = 20
        nameLabel = UILabel(frame: CGRectMake(orgX, orgY, ScreenWidth - orgX, loginLabelHeight))
        nameLabel.textAlignment = .Left
        nameLabel.text = "登陆"
        nameLabel.font = UIFont.systemFontOfSize(16)
        nameLabel.textColor = UIColor(red: CGFloat(51.0) / 255.0, green: CGFloat(51.0) / 255.0, blue: CGFloat(51.0) / 255.0, alpha: 1)
        self.addSubview(nameLabel)
        orgY += 34.0
        // 号码
        phoneLabel = UILabel(frame: CGRectMake(orgX, orgY, ScreenWidth - orgX, loginLabelHeight))
        phoneLabel.textAlignment = .Left
        phoneLabel.text = "130****333"
        phoneLabel.font = UIFont.systemFontOfSize(16)
        phoneLabel.textColor = UIColor(red: CGFloat(153.0) / 255.0, green: CGFloat(153.0) / 255.0, blue: CGFloat(153.0) / 255.0, alpha: 1)
        self.addSubview(phoneLabel)
        
        
    }
    class func settingCellWithTableView(tableView: UITableView) -> HZHMeHeadCell {
        let identifier = "HZHMeHeadCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? HZHMeHeadCell
        if cell == nil {
            cell = HZHMeHeadCell(style: .Default, reuseIdentifier: identifier)
            cell!.accessoryType = UITableViewCellAccessoryType.None
            cell!.selectionStyle = .None
            cell?.awakeFromNib()
        }
        
        return cell!
    }
    
    internal func setData(){
        if HZHUserAccountTool.userIsLogin() {
            let account: String? = HZHUserAccountTool.userAccount()
            phoneLabel.text = account
            nameLabel.text = account! + "用户"
        }
        
    }

}


/// MARK: iconViewDelegate
extension HZHMeHeadCell: IconViewDelegate {
    func iconView(iconView: IconView, didClick iconButton: UIButton) {
        //  判断用户是否登录了
        
    }
}
