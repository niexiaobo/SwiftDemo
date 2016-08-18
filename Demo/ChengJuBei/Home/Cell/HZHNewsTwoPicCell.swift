//
//  HZHNewsTwoPicCell.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/17.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit

class HZHNewsTwoPicCell: UITableViewCell {

    var ImageLabelViewLeft: HZHImageLabelView?
    var ImageLabelViewRight: HZHImageLabelView?
    var indexPath: NSIndexPath?
    var delegate: NewsTwoPicCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ImageLabelViewLeft = HZHImageLabelView(frame : CGRectMake(10, 0, (ScreenWidth-30)/2, (ScreenWidth-30)/2*101/173+42))
        ImageLabelViewLeft?.drawRect(CGRectMake(10, 0, (ScreenWidth-30)/2, (ScreenWidth-30)/2*101/173+42))
        ImageLabelViewLeft?.tag = 0
        ImageLabelViewLeft?.delegate = self
        self.addSubview(ImageLabelViewLeft!)
        
        ImageLabelViewRight = HZHImageLabelView(frame : CGRectMake(10+10+(ScreenWidth-30)/2, 0, (ScreenWidth-30)/2, (ScreenWidth-30)/2*101/173+42))
        ImageLabelViewRight?.drawRect(CGRectMake(10+10+(ScreenWidth-30)/2, 0, (ScreenWidth-30)/2, (ScreenWidth-30)/2*101/173+42))
        ImageLabelViewRight?.delegate = self
        ImageLabelViewRight?.tag = 1
        self.addSubview(ImageLabelViewRight!)
        
    }

    var postModelLeft: HZHHomeNewsJsonModel? {
        didSet {
            ImageLabelViewLeft?.postModel = postModelLeft
        }
    }
    var postModelRight: HZHHomeNewsJsonModel? {
        didSet {
            ImageLabelViewRight?.postModel = postModelRight
        }
    }
    
   internal var cellIndexPath: NSIndexPath?{
    
        didSet {
            indexPath = cellIndexPath
        }
    
    }
    
    class func settingCellWithTableView(tableView: UITableView) -> HZHNewsTwoPicCell {
        let identifier = "HZHNewsTwoPicCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? HZHNewsTwoPicCell
        if cell == nil {
            cell = HZHNewsTwoPicCell(style: .Default, reuseIdentifier: identifier)
            cell!.accessoryType = UITableViewCellAccessoryType.None
            cell!.selectionStyle = .None
            cell?.awakeFromNib()
        }
        
        return cell!
    }
}

///ImageLabelDelegate 代理方法 点击了按钮
extension HZHNewsTwoPicCell: ImageLabelDelegate {
    
    //MARK:- Delegate Methods
    func clickCurrentImage(currentIndxe: Int) {
       
       self.delegate?.tableViewSelect!(currentIndxe, didSelectRowAtIndexPath: indexPath!)
    }
}
//MARK:- Protocol Methods
@objc protocol NewsTwoPicCellDelegate {
    
    optional func tableViewSelect(btnTag: Int, didSelectRowAtIndexPath indexPath: NSIndexPath)
}

