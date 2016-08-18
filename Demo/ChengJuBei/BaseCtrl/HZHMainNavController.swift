//
//  HZHMainNavController.swift
//  ChengJuBei
//
//  Created by liuyong on 16/6/4.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit

class HZHMainNavController: UINavigationController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let navAppearance = UINavigationBar.appearance()
        navAppearance.translucent = false
        navAppearance.barTintColor = NavBarColor
        navAppearance.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        navAppearance.tintColor = UIColor.whiteColor()
       
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        super.preferredStatusBarStyle()
        return .LightContent
    }

}
