//
//  HZHMainTabBarController.swift
//  ChengJuBei
//
//  Created by liuyong on 16/6/3.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit

class HZHMainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAllChildControllers()
    }
    
    private func setUpAllChildControllers(){
        tabBarControlleraddChidController(HZHHomeViewController(), titleName: "首页", tabBarImage: "home_normal", tabBarSelectedImage: "home_selected")
        
        tabBarControlleraddChidController(HZHMatchViewController(), titleName: "赛事", tabBarImage: "match_normal", tabBarSelectedImage: "match_selected")
        
        tabBarControlleraddChidController(HZHClubViewController(), titleName: "俱乐部", tabBarImage: "club_normal", tabBarSelectedImage: "club_selected")
        
        tabBarControlleraddChidController(HZHMallViewController(), titleName: "票务", tabBarImage: "ticket_selected", tabBarSelectedImage: "ticket_selected")
        
        tabBarControlleraddChidController(HZHMeViewController(), titleName: "我的", tabBarImage: "me_normal", tabBarSelectedImage: "me_selected")
    }
    
    private func tabBarControlleraddChidController(vc: UIViewController,titleName title: String,tabBarImage imageName: String, tabBarSelectedImage selectedImageName: String){
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName),selectedImage: UIImage(named: selectedImageName))
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.redColor()], forState: .Selected)
        let nav = HZHMainNavController(rootViewController: vc)
        addChildViewController(nav)
    }
}
