//
//  API.swift
//  ChengJuBei
//
//  Created by liuyong on 16/6/4.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import Foundation
import Alamofire

//请求类方法：返回信息为nil表示成功
class API {
    
    func requestDataWith(url: String, dic: [String: AnyObject]?, callback: (NSDictionary?, String?)->()) {
        let params :[String: AnyObject]? = dic
        let URL : String = AppInfoService +  url
        
        Alamofire.request(Alamofire.Method.POST, URL, parameters: params, encoding: Alamofire.ParameterEncoding.URL).response { (request, response, data, error) -> Void in
            //把NSData对象转换回JSON对象
            let data: NSData = data!
            let json : AnyObject! = try? NSJSONSerialization
                .JSONObjectWithData(data, options:NSJSONReadingOptions.AllowFragments)
            
            
            if let unwrappedError = error {
                if unwrappedError.domain == NSURLErrorDomain && unwrappedError.code == NSURLErrorNotConnectedToInternet {
                    callback([:], "请求失败，请检查网络设置！")
                }
            } else {
                if json != nil {
                print("Json Object:"); print(json)
                
                //解析数据
                var code: String?
                code = json["code"] as? String
                
                if code != "0"{
                  let errorMsg: String? = json["message"] as? String
                  callback([:], errorMsg)
                    
                }else{
                    let jsonData: NSDictionary? = json["data"] as? NSDictionary
                    if (jsonData != nil) {
                        callback(jsonData, getMessageSuccess)
                    }else{
                        callback([:], getMessageSuccess)
                    }
             
                   }
                }
            }
        }
    }
    
    
    func getMessageError(errorMsg: String){
        //拿到报错信息
         print(errorMsg)
    }
}


