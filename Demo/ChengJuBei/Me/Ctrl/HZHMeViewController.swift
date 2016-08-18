//
//  HZHMeViewController.swift
//  ChengJuBei
//
//  Created by liuyong on 16/6/4.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit
import MJExtension

class HZHMeViewController: UIViewController , UIAlertViewDelegate  {
    private var loginLabel: UILabel!
    private var tableView: UITableView!
    
    private lazy var mineIcons: NSMutableArray = NSMutableArray(array: ["cm-order", "config"])
    private lazy var mineTitles: NSMutableArray = NSMutableArray(array: ["我的订单", "设置"])
    private var iconView: IconView?
    
    enum SDMineCellType: Int {
        /// 我的订单
        case MyOrder = 0
        /// 我的设置
        case MyCollect = 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "我的"
        // 设置tableView
        setTableView()
        
    }
    override func viewWillAppear(animated: Bool) {
        
        tableView.reloadData()
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
/// MARK: iconViewDelegate
extension HZHMeViewController: IconViewDelegate {
    func iconView(iconView: IconView, didClick iconButton: UIButton) {
        // TODO 判断用户是否登录了
        
    }
}
/// MARK:UITableViewDelegate, UITableViewDataSource 代理方法
extension HZHMeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 1
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 98
            }
            return 48
        } else {
            return 44
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && indexPath.row == 0{
            
            let cell = HZHMeHeadCell.settingCellWithTableView(tableView)
            let MeHeadCell :HZHMeHeadCell = cell
             MeHeadCell.setData()
            return MeHeadCell
        }else if indexPath.section == 0 && indexPath.row == 1{
            
            let cell = HZHMeHeadRaceCell.settingCellWithTableView(tableView)
            
            return cell
        } else {
            let identifier: String = "cell"
            
            var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: identifier)
                cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
                cell!.selectionStyle = .None
            }
            cell!.imageView!.image = UIImage(named: mineIcons[indexPath.section - 1] as! String)
            cell!.textLabel?.text = mineTitles[indexPath.section - 1] as? String
            
            return cell!
        }
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0{
            //  判断用户是否登录了
            if !HZHUserAccountTool.userIsLogin() {
                let login = HZHLoginViewController()
                navigationController?.pushViewController(login, animated: true)
            }
            
        }else if indexPath.section - 1 == SDMineCellType.MyCollect.hashValue  {         // 留言反馈
            let SettingVC = HZSettingViewController()
            navigationController?.pushViewController(SettingVC, animated: true)
        }
        
        print("didSelectRowAtIndexPath")
    }
    
}



