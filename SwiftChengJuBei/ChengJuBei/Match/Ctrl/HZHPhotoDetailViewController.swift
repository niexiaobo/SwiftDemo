//
//  HZHPhotoDetailViewController.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/20.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit
import YYWebImage

class HZHPhotoDetailViewController: UIViewController {
    
    // MARK: - 属性
    /// 文章详情请求参数
    var photoParam: (classid: String, id: String)? {
        didSet {
            loadPhotoDetail(photoParam!.classid, id: photoParam!.id)
        }
    }
    var isNavBarHidden: Bool?
    
    // 导航栏/背景颜色
    private let bgColor = UIColor(red:0.110,  green:0.102,  blue:0.110, alpha:0.9)
    
    /// 当前页显示的文字数据
    private var currentPageData: (page: Int, text: String)? {
        didSet {
            topTitleLabel.text = "\(currentPageData!.page) / \(photoModels.count)"
            captionLabel.text = "\(currentPageData!.text)"
            updateBottomBgViewConstraint()
        }
    }
    
    private let photoIdentifier = "photoDetail"
    private var photoModels = [HZHMatchInfoModel]()
    
    /// 用来做分享的标题连接
    var titleurl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavBarHidden = false
        prepareUI()
    }
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    }
    
    deinit {
        print("图库详情释放了")
    }
    
    /**
     滚动停止后调用，判断当然显示的第一张图片
     */
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / ScreenWidth)
        let model = photoModels[page]
        
        currentPageData = (page + 1, model.text!)
    }
    
    /**
     加载数据
     
     - parameter classid: 当前子分类id
     - parameter id:      文章id
     */
    @objc private func loadPhotoDetail(classid: String, id: String) {
        
        photoModels.removeAll()
        var parameters = [String : AnyObject]()
        
        parameters = [
            "table" : "news",
            "classid" : "classid",
            "id" : "id",
            "username" : "username",
            "userid" : "userid" ,
            "token" : "token",
        ]
        
        activityView.startAnimating()
        
         //标题url
        self.titleurl = "http://pic.58pic.com/58pic/12/77/30/44758PIC2er.jpg"
        let dict = [
            "title" : "女神柳岩瞄准网络文学，望出演阅文集团IP改编剧", // 图片标题
            "picurl" : "http://www.baokan.name/d/file/photo/picnews/2016-05-31/6e5e56cac27c72e61aa793d1365b4e81.jpg",  // 图片url
            "text" : "光线传媒总裁王长田携“光线一姐”柳岩亮相福布斯中国原创文学风云榜颁奖典礼。王长田认为，互联网与电影产业的融合是大势所趋，面对这波席卷而来的浪潮，优质网络文学IP的合作开发将成为未来影视内容重心所在。" // 图片文字描述
        ]
        
        let model = HZHMatchInfoModel(dict: dict)
        
        
        for _ in 0...6 {
            
             self.photoModels.append(model)
        }
       
        
        
        self.scrollViewDidEndDecelerating(self.collectionView)
        self.collectionView.reloadData()
        self.activityView.stopAnimating()
       
        
}

        

    // MARK: - 各种tap事件
    @objc private func didTappedRightBarButtonItem(item: UIBarButtonItem) -> Void {
        print("didTappedRightBarButtonItem")
        
    }
    
    /**
     准备UI
     */
    @objc private func prepareUI() {
        
        automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(collectionView)
        view.addSubview(navigationBarView)
//            view.addSubview(bottomToolView)
        view.addSubview(bottomBgView)
        bottomBgView.addSubview(captionLabel)
        navigationBarView.addSubview(topTitleLabel)
        view.addSubview(activityView)
        
        topTitleLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(navigationBarView)
            make.top.equalTo(20)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        
//            bottomToolView.snp_makeConstraints { (make) in
//                make.left.right.bottom.equalTo(0)
//                make.height.equalTo(45)
//            }
        
        bottomBgView.snp_makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(20)
        }
        
        captionLabel.snp_makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(10)
            make.width.equalTo(ScreenWidth - 40)
        }
        
        updateBottomBgViewConstraint()
    }
    
    /**
     更新底部详情视图的高度
     */
    @objc private func updateBottomBgViewConstraint() {
        
        view.layoutIfNeeded()
        bottomBgView.snp_updateConstraints { (make) in
            make.height.equalTo(captionLabel.height + 20)
        }
    }
    
    // MARK: - 懒加载
    /// 内容视图
    private lazy var collectionView: UICollectionView = {
        let myLayout = UICollectionViewFlowLayout()
        myLayout.itemSize = CGSize(width: ScreenWidth + 10, height: ScreenHeight)
        myLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        myLayout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: ScreenWidth + 10, height: ScreenHeight), collectionViewLayout: myLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.pagingEnabled = true
        collectionView.backgroundColor = UIColor(red:0.110,  green:0.102,  blue:0.110, alpha:1)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(HZHMatchPhotoDetailCell.self, forCellWithReuseIdentifier: self.photoIdentifier)
        return collectionView
    }()
    
    /// 自定义导航栏
    private lazy var navigationBarView: UIView = {
        let navigationBarView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 64))
        navigationBarView.backgroundColor = self.bgColor
        
        // 导航栏右边举报按钮
        let rightButton = UIButton(type: UIButtonType.Custom)
        rightButton.titleLabel?.font = UIFont.systemFontOfSize(16)
        rightButton.setTitle("举报", forState: UIControlState.Normal)
        rightButton.setTitleColor(UIColor(red:0.545, green:0.545, blue:0.545, alpha:1), forState: UIControlState.Normal)
        rightButton.addTarget(self, action: #selector(didTappedRightBarButtonItem(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        rightButton.frame = CGRect(x: ScreenWidth - 60, y: 20, width: 40, height: 40)
        navigationBarView.addSubview(rightButton)
        
        
        // 导航栏左边返回
        let leftButton = UIButton(type: UIButtonType.System)
        leftButton.setImage(UIImage.init(named: "whiteback"), forState: UIControlState.Normal)
        leftButton.addTarget(self, action: #selector(didTappedBackButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        leftButton.frame = CGRect(x: 0, y: 20, width: 44, height: 44)
        navigationBarView.addSubview(leftButton)
        
        return navigationBarView
    }()
    
    /// 活动指示器
    private lazy var activityView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
        activityView.center = self.view.center
        return activityView
    }()
    
    /// 底部文字透明背景视图
    private lazy var bottomBgView: UIView = {
        let bottomBgView = UIView()
        bottomBgView.backgroundColor = self.bgColor
        return bottomBgView
    }()
    
    /// 文字描述
    private lazy var captionLabel: UILabel = {
        let captionLabel = UILabel()
        captionLabel.textColor = UIColor(red:0.945,  green:0.945,  blue:0.945, alpha:1)
        captionLabel.numberOfLines = 0
        captionLabel.font = UIFont.systemFontOfSize(15)
        return captionLabel
    }()
    
    /// 底部工具条
//        private lazy var bottomToolView: UITabBar = {
//            bottomToolView = UITabBar()
//            
//           return bottomToolView
//        }()

    /// 顶部导航栏显示页码
    private lazy var topTitleLabel: UILabel = {
        let topTitleLabel = UILabel()
        topTitleLabel.textColor = UIColor(red:0.945,  green:0.945,  blue:0.945, alpha:1)
        topTitleLabel.font = UIFont.systemFontOfSize(15)
        return topTitleLabel
    }()
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension HZHPhotoDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoModels.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(photoIdentifier, forIndexPath: indexPath) as! HZHMatchPhotoDetailCell
        cell.delegate = self
        cell.model = photoModels[indexPath.item]
        return cell
    }
}

// MARK: - JFCommentCommitViewDelegate, JFPhotoBottomBarDelegate
extension HZHPhotoDetailViewController{
    
    /**
     返回
     */
    func didTappedBackButton(button: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    /**
     发布评论
     */
    func didTappedEditButton(button: UIButton) {
        
    }
    
    /**
     评论列表
     */
    func didTappedCommentButton(button: UIButton) {
       
    }
    
    /**
     收藏
     */
    func didTappedCollectButton(button: UIButton) {
        
       
    }
    
    /**
     分享
     */
    func didTappedShareButton(button: UIButton) {
        
       
    }
    
    /**
     点击了提交评论视图的发送按钮
     
     - parameter message: 评论信息
     */
    func didTappedSendButtonWithMessage(message: String) {
        
    }
}

// MARK: - HZHMatchPhotoDetailCellDelegate
extension HZHPhotoDetailViewController: JFPhotoDetailCellDelegate {
    
    /**
     单击事件
     */
    func didOneTappedPhotoDetailView(scrollView: UIScrollView) -> Void {
        
        let alpha: CGFloat = isNavBarHidden == false ? 0 : 1
        
        UIView.animateWithDuration(0.25, animations: {
            
            // 状态栏
            UIApplication.sharedApplication().setStatusBarHidden(!UIApplication.sharedApplication().statusBarHidden, withAnimation: UIStatusBarAnimation.Slide)
            
                // 隐藏和显示的平移效果
                if alpha == 0 {
                    self.bottomBgView.transform = CGAffineTransformTranslate(self.bottomBgView.transform, 0, 20)
//                    self.bottomToolView.transform = CGAffineTransformTranslate(self.bottomToolView.transform, 0, 20)
                    self.navigationBarView.transform = CGAffineTransformTranslate(self.navigationBarView.transform, 0, -20)
                    
                    self.isNavBarHidden = true
                } else {
                    self.bottomBgView.transform = CGAffineTransformTranslate(self.bottomBgView.transform, 0, -20)
//                    self.bottomToolView.transform = CGAffineTransformTranslate(self.bottomToolView.transform, 0, -20)
                    self.navigationBarView.transform = CGAffineTransformTranslate(self.navigationBarView.transform, 0, 20)
                    self.isNavBarHidden = false
                }
                
                // 底部视图
                self.bottomBgView.alpha = alpha
//                self.bottomToolView.alpha = alpha
            
            // 顶部导航栏
            self.navigationBarView.alpha = alpha
        }) { (_) in
            
        }
    }
    
    /**
     双击事件
     */
    func didDoubleTappedPhotoDetailView(scrollView: UIScrollView, touchPoint: CGPoint) -> Void {
        
        if scrollView.zoomScale <= 1.0 {
            let scaleX = touchPoint.x + scrollView.contentOffset.x
            let scaleY = touchPoint.y + scrollView.contentOffset.y
            scrollView.zoomToRect(CGRect(x: scaleX, y: scaleY, width: 10, height: 10), animated: true)
        } else {
            scrollView.setZoomScale(1.0, animated: true)
        }
    }
    
    /**
     持续滑动中判断偏移量
     */
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.x <= -30 {
            navigationController?.popViewControllerAnimated(true)
        }
    }
}
