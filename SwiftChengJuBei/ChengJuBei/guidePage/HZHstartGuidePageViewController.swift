//
//  HZHstartGuidePageViewController.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/29.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit

class HZHstartGuidePageViewController: UIViewController,UIPageViewControllerDataSource {
    
    var pageController:UIPageViewController!
    
    var headings = ["最新资讯", "赛事俱乐部", "票务"]
    var images = ["foodpin-intro-1", "foodpin-intro-2", "foodpin-intro-3"]
    var footers = ["最新资讯，最新视频动态", "最新赛事连连看，参与俱乐部，比赛排名", "参与投票，打折不断"]
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! HZHguidePageControlViewController).index
        
        index += 1
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! HZHguidePageControlViewController).index
        index -= 1
        
        return viewControllerAtIndex(index)
    }
    
    
    func viewControllerAtIndex(index: Int) -> HZHguidePageControlViewController? {
        if case 0 ..< headings.count = index {
            //创建一个新视图控制器并传递数据
            let contentVC : HZHguidePageControlViewController = HZHguidePageControlViewController()
            contentVC.imageName = images[index]
            contentVC.heading = headings[index]
            contentVC.footer = footers[index]
            contentVC.index = index
            contentVC.HomeButhidden = true
            if (headings.count - 1) == index {
               contentVC.HomeButhidden = false
            }
            
            return contentVC
            
            
        } else {
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        pageController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation:.Horizontal, options: [UIPageViewControllerOptionSpineLocationKey:NSNumber(float: 10)])
        pageController.dataSource = self
        self.addChildViewController(pageController)
        self.view.addSubview(pageController.view)
        
        
        //创建第一个页面
        if let startingVC = viewControllerAtIndex(0) {
            pageController.setViewControllers([startingVC], direction: .Forward, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

