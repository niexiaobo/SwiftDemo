//
//  HZHRefreshHeader.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/16.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit
import MJRefresh
class HZHRefreshHeader: MJRefreshGifHeader {
    
    override func prepare() {
        super.prepare()
        stateLabel!.hidden = true
        lastUpdatedTimeLabel!.hidden = true
        
        let idleImages = NSMutableArray()
        let idImage = UIImage(named: "dropdown_anim__0001")
        idleImages.addObject(idImage!)
        setImages(idleImages as [AnyObject], forState: MJRefreshStateIdle)
        
        let refreshingImages = NSMutableArray()
        let refreshingImage = UIImage(named: "dropdown_anim__0001")!
        refreshingImages.addObject(refreshingImage)
        setImages(refreshingImages as [AnyObject], forState: MJRefreshStatePulling)
        
        let refreshingStartImages = NSMutableArray()
        for i in 1...60 {
            let image = UIImage(named: String(format: "dropdown_anim__000%d", i))
            print(String(format: "dropdown_anim__000%d", i))
            refreshingStartImages.addObject(image!)
        }
        setImages(refreshingStartImages as [AnyObject], duration: 1.0, forState: MJRefreshStateRefreshing)
        
//        setImages(refreshingStartImages as [AnyObject], forState: MJRefreshStateRefreshing)
        
    }
    
}
