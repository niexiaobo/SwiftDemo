//
//  UIView+wnxView.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/14.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import Foundation
import UIKit
/// 对UIView的扩展
extension UIView {
    /// X值
    var x: CGFloat {
        return self.frame.origin.x
    }
    /// Y值
    var y: CGFloat {
        return self.frame.origin.y
    }
    /// 宽度
    var width: CGFloat {
        return self.frame.size.width
    }
    ///高度
    var height: CGFloat {
        return self.frame.size.height
    }
    var size: CGSize {
        return self.frame.size
    }
    var point: CGPoint {
        return self.frame.origin
    }
}