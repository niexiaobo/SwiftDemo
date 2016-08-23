//
//  HZSettingViewController.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/14.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit


class HZSettingViewController: UIViewController {
    
    private var tableView: UITableView!
    private lazy var mineTitles: NSMutableArray = NSMutableArray(array: ["邀请好友", "清除缓存", "关于城俱杯"])
    private var iconView: IconView?
    
    enum SDMineSettingCellType: Int {
        // 邀请好友
        case MyFriend = 0
        // 清除缓存
        case MyCaches = 1
        // 关于城俱杯
        case MyAbout = 2
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "设置"
        // 设置tableView
        setTableView()
    }
    
    private func setTableView() {
        self.automaticallyAdjustsScrollViewInsets = false
        
        tableView = UITableView(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight - NavigationH - 49), style: UITableViewStyle.Grouped)
        tableView.backgroundColor = UIColor(red: CGFloat(245.0) / 255.0, green: CGFloat(245.0) / 255.0, blue: CGFloat(245.0) / 255.0, alpha: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 45
        tableView.sectionFooterHeight = 0.1
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        view.addSubview(tableView)
        
    }
    
}
/// MARK:UITableViewDelegate, UITableViewDataSource 代理方法
extension HZSettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return mineTitles.count
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier: String = "cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: identifier)
            cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell!.selectionStyle = .None
        }
        if indexPath.section == 0 {
//            cell!.imageView!.image = UIImage(named: "yaoyiyao")
            cell!.textLabel!.text = "验票"
        } else {
//            cell!.imageView!.image = UIImage(named: mineIcons[indexPath.row] as! String)
            cell!.textLabel?.text = mineTitles[indexPath.row] as? String
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("didSelectRowAtIndexPath")
    }
    
}

