//
//  HZHHTMLPageViewController.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/21.
//  Copyright © 2016年 hongzhi. All rights reserved.
//

import UIKit

class HZHHTMLPageViewController: UIViewController, UIWebViewDelegate,UITextFieldDelegate {
    
    var btngo:UIButton!
    var loadIndicator:UIActivityIndicatorView!
    var didLoad: Bool?
    
    //进度条计时器
    var ptimer:NSTimer!
    //进度条控件
    var progBar:UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        
        goClicked()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.tabBarController?.tabBar.hidden = true
       
    }
    
    
    private func prepareUI() {
        
        view.backgroundColor = UIColor.whiteColor()
        //构建浏览器工具条
        setupBrowserToolbar()
        view.addSubview(webview)
        
        
        loadIndicator = UIActivityIndicatorView(frame: CGRectMake((ScreenWidth - 32.0)/2.0, (ScreenHeight - 32.0)/2.0, 32.0, 32.0));
        loadIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.view.addSubview(loadIndicator)
        
    }
    /// webView
    private lazy var webview: UIWebView = {
        let webview = UIWebView(frame: CGRect(x: 0, y: 64, width: ScreenWidth, height: ScreenHeight - 64))
        webview.scrollView.scrollEnabled = true
        webview.scrollView.bounces = true
        webview.delegate = self
        return webview
    }()
    func setupBrowserToolbar()
    {
        // 创建一个浏览器工具条，并设置它的大小和位置
        let browserToolbar =  UIToolbar(frame:CGRectMake(0, 20, ScreenWidth, 42))
        browserToolbar.backgroundColor = UIColor.whiteColor()
        // 将工具条添加到当前应用的界面中
        self.view.addSubview(browserToolbar)
        
        //创建图片工具条，但是不是直接使用文件名，而是用 NSData 方式初始化 UIImage
//        let path = NSBundle.mainBundle().pathForResource("back", ofType:"png")
//        
//        let urlStr = NSURL.fileURLWithPath(path!);
//        let data = NSData(contentsOfURL:urlStr);
        let btnback =  UIBarButtonItem(image:UIImage(named:"back"),
                                       style:.Plain, target:self,action:#selector(HZHHTMLPageViewController.backClicked(_:)));
        
        //第一个分隔按钮
        let btngap1 =  UIBarButtonItem(barButtonSystemItem:.FlexibleSpace,
                                       target:nil,
                                       action:nil);
        // 创建前进按钮 UIBarButtonItem
        let btnforward = UIBarButtonItem(image:UIImage(named:"forward"),
                                         style:.Plain, target:self, action:#selector(HZHHTMLPageViewController.forwardClicked(_:)));
        
        // 第二个分隔按钮，创建一个可伸缩的UIBarButtonItem
        let btngap2 =  UIBarButtonItem(barButtonSystemItem:.FlexibleSpace,
                                       target:nil,
                                       action:nil);
        
        // 创建重新加载按钮 UIBarButtonItem
        let btnreload = UIBarButtonItem(image:UIImage(named:"reload"),
                                        style:.Plain, target:self, action:#selector(HZHHTMLPageViewController.reloadClicked(_:)));
        
        //第三个分隔按钮
        let btngap3 =  UIBarButtonItem(barButtonSystemItem:.FlexibleSpace,
                                       target:nil,
                                       action:nil);
        
        //创建加载停止按钮
        let btnstop = UIBarButtonItem(image:UIImage(named:"stop"),
                                      style:.Plain, target:self, action:#selector(HZHHTMLPageViewController.stopClicked(_:)));
        
        //第四个分隔按钮
        let btngap4 =  UIBarButtonItem(barButtonSystemItem:.FlexibleSpace,
                                       target:nil,
                                       action:nil);
        
        //创建进度工具条
        progBar = UIProgressView(progressViewStyle:UIProgressViewStyle.Bar)
        
        // 设置UIProgressView的大小
        progBar.frame = CGRectMake(0 , 62 , ScreenWidth, 2)
        
        // 设置该进度条的初始进度为0
        progBar.progress = 0
        
        // 创建使用 UIView 的自定义的 UIBarButtonItem
//        let btnprog =  UIBarButtonItem(customView:progBar)
        self.view.addSubview(progBar)
        // 为工具条设置工具按钮
        browserToolbar.setItems( [btnback,btngap1, btnforward,btngap2,
            btnreload,btngap3, btnstop,btngap4 ], animated:true)

    }
    
    
    /*
     在 UIWebView 加载指定 URL
     */
    func loadUrl(url:String)
    {
        let urlobj = NSURL(string:url)
        
        let request = NSURLRequest(URL:urlobj!)
        
        self.webview.loadRequest(request);
    }
    
    func stopClicked(sender:UIBarButtonItem)
    {
        webview.stopLoading()
    }
    
    func reloadClicked(sender:UIBarButtonItem)
    {
        webview.reload()
    }
    
    func backClicked(sender:UIBarButtonItem)
    {
         self.navigationController?.popViewControllerAnimated(true)
//         webview.goBack()
        
    }
    
    func forwardClicked(sender:UIBarButtonItem)
    {
        webview.goForward()
        
    }
    
    func goClicked()
    {
        
        let url = "http://www.baokan.name//news/china/2016-06-20/52077.html";
        loadUrl(url)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func webViewDidStartLoad(webView:UIWebView)
    {
        didLoad = false
        progBar.hidden = false
        progBar.setProgress(0, animated:false);
        //创建计时器对象
        ptimer = NSTimer.scheduledTimerWithTimeInterval(0.1,
                                                        target:self ,selector: #selector(HZHHTMLPageViewController.loadProgress),
                                                        userInfo:nil,repeats:true);
        
        ptimer.fire();
    
    }
    func webViewDidFinishLoad(webView:UIWebView)
    {
        didLoad = true
        
    }
    
  
    func loadProgress()
    {
            var progressNum: Float = 0.7
            var Barprogre: Float = 0.01
            if didLoad == false {
                progressNum = 0.7
                Barprogre = 0.01
            }else{
                
                progressNum = 1.0
                Barprogre = (1.0 - progBar.progress)/10
                Barprogre = Barprogre > 0 ? Barprogre + 0.02 : 0.01
            }
            // 如果进度满了，停止计时器
            if(progBar.progress >= progressNum){
                // 停用计时器
                ptimer.invalidate();
                if(progBar.progress >= 1.0)
                {
                    progBar.hidden = true
                }
            }else{
                // 改变进度条的进度值
                progBar.setProgress(progBar.progress + Barprogre, animated:true);
               
            }
        
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?)
    {
//        let alertController = UIAlertController(title: "出错!",
//                                                message: error!.localizedDescription,
//                                                preferredStyle: UIAlertControllerStyle.Alert)
//        let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Cancel,
//                                     handler: nil)
//        alertController.addAction(okAction)
//        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
