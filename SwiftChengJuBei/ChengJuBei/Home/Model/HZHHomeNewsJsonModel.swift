//
//  HZHHomeNewsJsonModel.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/17.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit

class HZHHomeNewsJsonModel: NSObject {
    var news_id : String?
    var news_type : String?
    var news_title : String
    var news_abstract : String
    var create_time : String?
    var watch_count : String?
    var preview_image : String
    var image_list : NSArray?
    
    override init() {
        news_title = "北京实验二小白云路分校操场开始拆除"
        news_abstract = "北京市西城区教委对实验二小白云路分校操场进行全场拆除。据现场施工方介绍，拆除工程将进行三日，周一学校将正常上课"
        preview_image = "http://pic3.nipic.com/20090612/2012851_142953053_2.jpg"
    }
    
}
