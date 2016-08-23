//
//  HZHHomeViewController.swift
//  ChengJuBei
//
//  Created by liuyong on 16/6/4.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit
import MJRefresh

public let SD_RefreshImage_Height: CGFloat = 40
public let SD_RefreshImage_Width: CGFloat = 35

class HZHHomeViewController: UIViewController {

    private var tableView: UITableView!
    private var circleView: HZHRollingcycleView!
    private var dataArray: NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "首页"
        // 设置tableView
        setTableView()
       
        requestData()
        
        //轮播图
        self.setRollingcycle()
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.tabBarController?.tabBar.hidden = false
    }

    func requestData(){
        
        let apiRequest = API()
        if HZHUserAccountTool.userIsLogin() {
            let SessionId: String? = HZHUserAccountTool.userSessionId()
            let dics : NSDictionary = ["session_id": SessionId! , "platform_id" : "2" , "language_abbreviation" : "zh"]

            tableView.mj_header.endRefreshing()
            
            apiRequest.requestDataWith(APINameHomeV5, dic: dics as? [String : AnyObject]) { (jsonData, errorMsg) -> () in
                if errorMsg != getMessageSuccess {
                    apiRequest.getMessageError(errorMsg!)
                }else{
                    //返回信息为nil表示成功
                    let userInfo: NSArray? = jsonData!["advertisement"] as? NSArray
                    if (userInfo != nil) {
                        //创建数据模型
                        self.dataArray = HZHHomeDataModel.mj_objectArrayWithKeyValuesArray(userInfo)
                        
                        //轮播图
                        self.setRollingcycle()
                    }
                }
                
            }
        }
        
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
        //刷新
        setTableviewRefresh()
        
    }
    
    func setTableviewRefresh(){
        let diyHeader = HZHRefreshHeader(refreshingTarget: self, refreshingAction: #selector(HZHHomeViewController.loadDatas))
        diyHeader.lastUpdatedTimeLabel!.hidden = true
        diyHeader.stateLabel!.hidden = true
        diyHeader.gifView!.frame = CGRectMake((ScreenWidth - SD_RefreshImage_Width) * 0.5, 10, SD_RefreshImage_Width, SD_RefreshImage_Height)
        tableView.mj_header = diyHeader
        
    }
    func loadDatas(){
        requestData()
    }
    
    func setRollingcycle() {
        
        var urlImageArray: [String] = []
        
        for HomeDataM in self.dataArray != nil ?  self.dataArray! : [] {
            
            let HomeDataM: HZHHomeDataModel = (HomeDataM as? HZHHomeDataModel)!
            let ad_location = HomeDataM.ad_location
            if ad_location == "101" {
                if HomeDataM.image_list != nil {
                    let image_list: NSArray = HZHRollingcycleModel.mj_objectArrayWithKeyValuesArray(HomeDataM.image_list)
                    
                    for index in 0..<image_list.count {
                        let Rolling: HZHRollingcycleModel = (image_list[index] as? HZHRollingcycleModel)!
                        if Rolling.image_url != nil {
                            print(AppInfoService + Rolling.image_url!)
                            let imageurl: String = AppInfoService + Rolling.image_url!
                            
                            urlImageArray.append(imageurl)
                            
                        }
                    }
                }
                
              
            }
            break
        }
    let urlImagerray: [String] = ["http://www.baokan.name/d/file/photo/picnews/2016-05-31/6e5e56cac27c72e61aa793d1365b4e81.jpg","http://pic1.nipic.com/2008-09-08/200898163242920_2.jpg","http://www.baokan.name/d/file/photo/picnews/2016-05-31/6e5e56cac27c72e61aa793d1365b4e81.jpg"]
    //来自网络图片
    let imageArray: NSArray = urlImagerray
    
    self.circleView = HZHRollingcycleView(frame: CGRectMake(0, 0, self.view.frame.size.width, 200), imageArray: imageArray as? [String])
    circleView.backgroundColor = UIColor.orangeColor()
    circleView.delegate = self
    
    tableView.tableHeaderView = circleView
        
    }
}
    /// 轮播图 RollingcycleDelegate 代理方法
    extension HZHHomeViewController: RollingcycleDelegate {
        
        //MARK:- Privite Methods
        func setImage(sender: UIButton) {
        }
        //MARK:- Delegate Methods
        //MARK: CirCleViewDelegate Methods
        func clickCurrentImage(currentIndxe: Int) {
            print(currentIndxe, terminator: "");
        }
    }
    /// MARK:UITableViewDelegate, UITableViewDataSource 代理方法
    extension HZHHomeViewController: UITableViewDelegate, UITableViewDataSource ,NewsTwoPicCellDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 2{
            return 1
        }
        return 2
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 || indexPath.section == 2 {
            return 35
        }
        return (ScreenWidth-30)/2*101/173+42+15

    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 || indexPath.section == 2 {
            let cell = HZHNewsSectionCell.settingCellWithTableView(tableView)
            let NewsSectionCell :HZHNewsSectionCell = cell
            NewsSectionCell.titleLable?.text = indexPath.section == 0 ? "最新资讯" : "最新视频"
            NewsSectionCell.moreLable?.text = "更多 >"
            NewsSectionCell.HomeCellImage.image = UIImage.init(named: indexPath.section == 0 ? "iconfont-xinwenzixun-2" : "cm-order")
            
            NewsSectionCell.moreButton?.tag = indexPath.section
            NewsSectionCell.moreButton?.addTarget(self,action:#selector(moreButton(_:)),forControlEvents:.TouchUpInside)
            
            return NewsSectionCell
        }
        
            let cell = HZHNewsTwoPicCell.settingCellWithTableView(tableView)
            let HomeViewCell :HZHNewsTwoPicCell = cell
            HomeViewCell.cellIndexPath = indexPath
            HomeViewCell.delegate = self
            let postModelleft = HZHHomeNewsJsonModel.init()
        
            postModelleft.preview_image = indexPath.section == 1 ? "http://www.baokan.name/d/file/photo/picnews/2016-02-14/c182d51f7ce6c8a4d09b1d874df8a42c.jpg" : "http://www.baokan.name/d/file/photo/picnews/2016-05-31/6e5e56cac27c72e61aa793d1365b4e81.jpg"
            HomeViewCell.postModelLeft = postModelleft
            
            let postModelRight = HZHHomeNewsJsonModel.init()
            postModelRight.preview_image = indexPath.section == 1 ? "http://www.baokan.name/d/file/photo/picnews/2016-02-14/6d26419e067d62c5d83f34c2b6cf5910.jpg" : "http://www.baokan.name/d/file/photo/picnews/2016-02-14/9d184b1343af73519377129521773b01.jpg"
        
            HomeViewCell.postModelRight = postModelRight
        
            return HomeViewCell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    func tableViewSelect(btnTag: Int, didSelectRowAtIndexPath indexPath: NSIndexPath){
    
        print("说明:点击 左边 0 右边 1 :" , btnTag , "NSIndexPath:" , indexPath.row)
        if indexPath.section == 1{
            let detailVc = HZHHTMLPageViewController()
            navigationController?.pushViewController(detailVc, animated: true)
            
        }else if indexPath.section == 3{
            let detailVc = HZHVideoPlayerViewController()
            detailVc.index = indexPath
            navigationController?.pushViewController(detailVc, animated: true)
        
        }
    }
    
    func moreButton(button:UIButton){
        if button.tag == 0 {
            let detailVc = HZHNewsListViewController()
            navigationController?.pushViewController(detailVc, animated: true)
        }
        
    }
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        return nil
    }
}

