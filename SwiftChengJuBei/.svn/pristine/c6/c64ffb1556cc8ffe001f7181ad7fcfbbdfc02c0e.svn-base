//
//  HZHUserAccountTool.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/15.
//  Copyright © 2016年 hongzhi. All rights reserved.
//



class HZHUserAccountTool: NSObject {
    /// 判断当前用户是否登录
    class func userIsLogin() -> Bool {
        let user = NSUserDefaults.standardUserDefaults()
        let account = user.objectForKey(UserDefaultsAccount) as? String
        let password = user.objectForKey(UserDefaultsPassword) as? String
        
        if account != nil && password != nil {
            if !account!.isEmpty && !password!.isEmpty {
                return true
            }
        }
        return false
    }
    
    /// 如果用户登录了,返回用户的账号(电话号)
    class func userAccount() -> String? {
        if !userIsLogin() {
            return nil
        }
        
        let user = NSUserDefaults.standardUserDefaults()
        let account = user.objectForKey(UserDefaultsAccount) as? String
        return account!
    }

    /// 如果用户登录了,返回用户的SessionId
    class func userSessionId() -> String? {
        if !userIsLogin() {
            return nil
        }
        
        let user = NSUserDefaults.standardUserDefaults()
        let SessionId = user.objectForKey(UserDefaultsSessionId) as? String
        return SessionId!
    }
}
