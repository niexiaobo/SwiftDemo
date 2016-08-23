//
//  HZHBaseTableViewController.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/21.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit

class HZHBaseTableViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.tabBarController?.tabBar.hidden = false
    }
    

}
