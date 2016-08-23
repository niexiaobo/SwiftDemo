//
//  HZHMatchViewController.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/20.
//  Copyright © 2016年 hongzhi. All rights reserved.
//


import UIKit
import Alamofire

class HZHMatchViewController: UIViewController {
    private var tableView: UITableView!
    lazy var dataArray: [HZHMatchInfoModel] = [HZHMatchInfoModel]()
    var photoList = [HZHMatchArticleListModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = "赛事"
        
        
        loadData()
        // 设置tableView
        setTableView()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.tabBarController?.tabBar.hidden = false
    }

    private func loadData(){
        
        var dict = [
            "title" : "文章标题创建文章时间戳", // 文章标题
            "state" : "预热",
            "bclassid" : "bclassid",    // 终极栏目id
            "classid" : "classid",      // 当前子分类id
            "newstime" : "newstime",    // 发布时间
            "created_at" : "created_at",// 创建文章时间戳
            "username" : "username",    // 用户名
            "onclick" : "onclick",      // 点击量
            "smalltext" : "smalltext",  // 简介
            "id" : "id",                // 文章id
            "classname" : "classname",  // 分类名称
            "table" : "table",          // 数据表名
            "titleurl" : "titleurl", // 文章url
        ]
        dict["titlepic"] = "http://www.baokan.name/d/file/photo/picnews/2016-05-31/6e5e56cac27c72e61aa793d1365b4e81.jpg"
        let postModel = HZHMatchArticleListModel(dict: dict)
        
        for _ in 0...6 {
            
            photoList.insert(postModel, atIndex: 0)
        }
        

    }
    private func setTableView() {
        self.automaticallyAdjustsScrollViewInsets = false
        
        tableView = UITableView(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight - NavigationH - 49), style: UITableViewStyle.Plain)
        tableView.backgroundColor = DarkColor245
        
        tableView.delegate = self
        tableView.dataSource = self
        //        tableView.rowHeight = 298
        tableView.sectionFooterHeight = 0.1
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableView.separatorStyle = .None
        view.addSubview(tableView)
        
    }

}
/// MARK:UITableViewDelegate, UITableViewDataSource 代理方法
extension HZHMatchViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return photoList.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cellHeight: CGFloat = 14 + (ScreenWidth - 28)*(152.0 / 286.0)  //286 152
        return cellHeight
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "HZHMatchPhotoListCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? HZHMatchPhotoListCell
        if cell == nil {
            cell = HZHMatchPhotoListCell(style: .Default, reuseIdentifier: identifier)
            cell!.accessoryType = UITableViewCellAccessoryType.None
            cell!.selectionStyle = .None
            
        }
        
        cell!.postModel = photoList[indexPath.row]
        
        
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVc = HZHPhotoDetailViewController()
        detailVc.photoParam = ("1", "2")
        navigationController?.pushViewController(detailVc, animated: true)
        
    }
   
}
