//
//  HZHBaseViewController.swift
//  ChengJuBei
//
//  Created by liuyong on 16/6/4.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit

class HZHBaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.tabBarController?.tabBar.hidden = true
    }

}
