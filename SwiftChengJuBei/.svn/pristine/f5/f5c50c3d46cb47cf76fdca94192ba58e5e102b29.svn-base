//
//  HZHMeHeadRaceCell.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/14.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit

class HZHMeHeadRaceCell: UITableViewCell {

    private var RaceView: HZHHeadRaceView?
    override func awakeFromNib() {
        super.awakeFromNib()
        let imageH :CGFloat = 48.0
        let nameArray : NSArray = ["参加的赛事","关注","粉丝"]
        let numberArray : NSArray = ["5","66","888"]
        
        for index in 0...2 {
           
            // 添加HZHHeadRaceView
            RaceView = HZHHeadRaceView(frame: CGRectMake(CGFloat(index) * (ScreenWidth / 3.0), 0, ScreenWidth / 3.0, imageH))
            RaceView?.nameLabel.text = nameArray[index] as? String
            RaceView?.numberLabel.text = numberArray[index] as? String
            self.addSubview(RaceView!)
            
        }
    }
    
    class func settingCellWithTableView(tableView: UITableView) -> UITableViewCell {
        let identifier: String = "HZHMeHeadRaceCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil {
            cell = HZHMeHeadRaceCell(style: .Default, reuseIdentifier: identifier)
            cell!.accessoryType = UITableViewCellAccessoryType.None
            cell!.selectionStyle = .None
            cell?.awakeFromNib()
        }
        
        return cell!
    }
    
}
