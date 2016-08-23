//
//  HZHNewsListViewController.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/21.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit
let NewsListImgCellHeight = (79.0/112.0)*((ScreenWidth-40.0)/3.0)+16*3+21

class HZHNewsListViewController: UIViewController {
    private var tableView: UITableView!
    private var dataArray: NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "最新资讯"
        
        setData()
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.tabBarController?.tabBar.hidden = false
    }
    private func setTableView() {
        self.automaticallyAdjustsScrollViewInsets = false
        
        tableView = UITableView(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight - NavigationH - 49), style: UITableViewStyle.Plain)
        tableView.backgroundColor = UIColor(red: CGFloat(245.0) / 255.0, green: CGFloat(245.0) / 255.0, blue: CGFloat(245.0) / 255.0, alpha: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        //        tableView.rowHeight = 298
        tableView.sectionFooterHeight = 0.1
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        view.addSubview(tableView)
        
        
    }
    private func setData() {
        
        let news_type = ["0","1","0","1"]
        let news_title = ["女神柳岩瞄准网络文学","回顾过去两年火爆的影视剧","掌阅科技年会暨2015年度表彰大会","红毯走秀入场环节"]
        let news_abstract = ["光线传媒总裁王长田携“光线一姐”柳岩亮相福布斯中国原创文学风云榜颁奖典礼。","文学对于影视圈何等重要：《花千骨》《琅琊榜》《芈月传》《鬼吹灯》","数百名新老员工以及嘉宾，气氛热烈","现场汇集了数百名新老员工以及嘉宾"]
        let preview_image = ["http://www.baokan.name/d/file/photo/picnews/2016-02-14/5de3d08aaa98f3c3620b7653d447b9c6.jpg","http://www.baokan.name/d/file/photo/picnews/2016-02-14/2572f87fa9ae1e9ff63857ae6ff4b142.jpg","http://www.baokan.name/d/file/photo/picnews/2016-02-14/2713cc522882a282e5f8616292fcfba1.jpg","http://www.baokan.name/d/file/photo/picnews/2016-02-14/605bcedb9e5c884f0efadc250358da7b.jpg"]
//        let image_list = ["0","1","0","1"]
        
        for index in 0..<news_type.count {
            let NewsJsonModel = HZHHomeNewsJsonModel()
            NewsJsonModel.news_type = news_type[index]
            NewsJsonModel.news_title = news_title[index]
            NewsJsonModel.news_abstract = news_abstract[index]
            NewsJsonModel.preview_image = preview_image[index]
//            NewsJsonModel.image_list = image_list[index]
            if dataArray == nil {
                dataArray = []
            }
            dataArray.addObject(NewsJsonModel)
        }
        
        // 设置tableView
        setTableView()
        
        
    }
}
/// MARK:UITableViewDelegate, UITableViewDataSource 代理方法
extension HZHNewsListViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row <= 1 {
           return 102
        }
        return NewsListImgCellHeight
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row <= 1  {
            
            let cell = HZHNewsOnePicCell.settingCellWithTableView(tableView) 
            let NewsJsonModel = dataArray[indexPath.row]
            cell.postModel = NewsJsonModel as? HZHHomeNewsJsonModel
            if indexPath.row == 0 {
                cell.lineTop?.hidden = false
            }else{
                cell.lineTop?.hidden = true
            }
            return cell
        }
        
        let cell = NewsThreePicCell.settingCellWithTableView(tableView)
        let NewsJsonModel = dataArray[indexPath.row]
        cell.postModel = NewsJsonModel as? HZHHomeNewsJsonModel
        if indexPath.row == 0 {
            cell.lineTop?.hidden = false
        }else{
            cell.lineTop?.hidden = true
        }
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVc = HZHPhotoDetailViewController()
        detailVc.photoParam = ("1", "2")
        navigationController?.pushViewController(detailVc, animated: true)
        
    }
    
}
