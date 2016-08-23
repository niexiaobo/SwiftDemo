//
//  HZHClubViewController.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/14.
//  Copyright © 2016年 hongzhi. All rights reserved.
//"俱乐部"

import UIKit
import MJExtension

class HZHClubViewController: UIViewController , UIAlertViewDelegate  {
    private var loginLabel: UILabel!
    private var tableView: UITableView!
    
    private lazy var mineIcons: NSMutableArray = NSMutableArray(array: ["cm-training", "cm-training", "cm-training"])
    private lazy var mineTitles: NSMutableArray = NSMutableArray(array: ["俱乐部排名", "我的训练情况", "我的个人排名"])
    private var iconView: IconView?
    
    enum SDMineCellType: Int {
        /// 我的订单
        case MyOrder = 0
        /// 我的设置
        case MyCollect = 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "俱乐部"
        // 设置tableView
        setTableView()
        
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.hidden = true
        tableView.reloadData()
    }
    private func setTableView() {
        self.automaticallyAdjustsScrollViewInsets = false
        
        tableView = UITableView(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight - 49), style: UITableViewStyle.Plain)
        tableView.backgroundColor = DarkColor245
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 45
        tableView.sectionFooterHeight = 0.1
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        let tableHeadView = HZHtableHeadView()
        tableHeadView.drawRect(CGRect(x: 0, y: 0, width: 0, height:0))
        tableView.tableHeaderView = tableHeadView
        view.addSubview(tableView)
        
        
    }
   
}
/// MARK: iconViewDelegate
extension HZHClubViewController: IconViewDelegate {
    func iconView(iconView: IconView, didClick iconButton: UIButton) {
        // TODO 判断用户是否登录了
        
    }
}
/// MARK:UITableViewDelegate, UITableViewDataSource 代理方法
extension HZHClubViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         return 2
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            if indexPath.row == 0 {
                return 14
            }
            return 44
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
            let identifier: String = "cell"
            
            var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: identifier)
                cell!.selectionStyle = .None
            }
            cell!.accessoryType = UITableViewCellAccessoryType.None
            cell?.backgroundColor = DarkColor245
            cell?.detailTextLabel?.text = ""
            if indexPath.row == 1 {
                cell?.backgroundColor = UIColor.whiteColor()
                cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
                cell!.imageView!.image = UIImage(named: mineIcons[indexPath.section] as! String)
                cell!.textLabel?.text = mineTitles[indexPath.section] as? String
                if indexPath.section == 1 {
                    cell?.detailTextLabel?.text = "查看更多订单"
                }
                
            }
            return cell!
        
        
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

