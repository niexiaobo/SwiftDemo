//
//  HZHHZHLoginViewController.swift
//  ChengJuBei
//
//  Created by 博彦科技-聂小波 on 16/6/15.
//  Copyright © 2016年 hongzhi. All rights reserved.
//
import UIKit
import SVProgressHUD

class HZHLoginViewController: UIViewController, UIScrollViewDelegate {
    
    var bottomView: UIView!
    var backScrollView: UIScrollView!
    var topView: UIView!
    var phoneTextField: UITextField!
    var psdTextField: UITextField!
    var loginImageView: UIImageView!
    var quickLoginBtn: UIButton!
    var forgetPwdImageView: UIImageView!
    var registerImageView: UIImageView!
    let textCoclor: UIColor = DarkColor51
    var LoginModel: HZHLoginModel?
    let loginW: CGFloat = 250
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "登录"
        view.backgroundColor = BackGColor
        //添加scrollView
        addScrollView()
        // 添加手机文本框和密码文本框
        addTextField()
        // 添加登录View
        addLoginImageView()
        // 添加快捷登录按钮
        addQuictLoginBtn()
        // 添加底部忘记密码和注册view
        addBottomView()
        // 添加键盘通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HZHLoginViewController.keyboardWillChangeFrameNotification(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func addScrollView() {
        backScrollView = UIScrollView(frame: view.bounds)
        backScrollView.backgroundColor = BackGColor
        backScrollView.alwaysBounceVertical = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(HZHLoginViewController.backScrollViewTap))
        backScrollView.addGestureRecognizer(tap)
        view.addSubview(backScrollView)
    }
    
    func addLoginImageView() {
        let loginH: CGFloat = 50
        loginImageView = UIImageView(frame: CGRectMake((ScreenWidth - loginW) * 0.5, CGRectGetMaxY(topView!.frame) + 10, loginW, loginH))
        loginImageView.userInteractionEnabled = true
        loginImageView.image = UIImage(named: "signin_1")
        
        let loginLabel = UILabel(frame: loginImageView.bounds)
        loginLabel.text = "登  录"
        loginLabel.textAlignment = .Center
        loginLabel.textColor = textCoclor
        loginLabel.font = UIFont.systemFontOfSize(22)
        loginImageView.addSubview(loginLabel)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(HZHLoginViewController.loginClick))
        loginImageView.addGestureRecognizer(tap)
        
        backScrollView.addSubview(loginImageView)
    }
    
    func addTextField() {
        let textH: CGFloat = 55
        let leftMargin: CGFloat = 10
        let alphaV: CGFloat = 0.2
        topView = UIView(frame: CGRectMake(0, 20, ScreenWidth, textH * 2))
        topView?.backgroundColor = UIColor.whiteColor()
        backScrollView.addSubview(topView!)
        
        let line1 = UIView(frame: CGRectMake(0, 0, ScreenWidth, 1))
        line1.backgroundColor = UIColor.grayColor()
        line1.alpha = alphaV
        topView!.addSubview(line1)
        
        phoneTextField = UITextField()
        phoneTextField?.keyboardType = UIKeyboardType.NumberPad
        addTextFieldToTopViewWiht(phoneTextField!, frame: CGRectMake(leftMargin, 1, ScreenWidth - leftMargin, textH - 1), placeholder: "请输入手机号")
        
        let line2 = UIView(frame: CGRectMake(0, textH, ScreenWidth, 1))
        line2.backgroundColor = UIColor.grayColor()
        line2.alpha = alphaV
        topView!.addSubview(line2)
        
        psdTextField = UITextField()
        addTextFieldToTopViewWiht(psdTextField!, frame: CGRectMake(leftMargin, textH + 1, ScreenWidth - leftMargin, textH - 1), placeholder: "密码")
        
        phoneTextField.text = "15895523287"
        psdTextField.text = "111111"
    }
    
    func addQuictLoginBtn() {
        quickLoginBtn = UIButton()
        quickLoginBtn.setTitle("无账号快捷登录", forState: .Normal)
        quickLoginBtn.titleLabel?.sizeToFit()
        quickLoginBtn.contentMode = .Right
        let quickW: CGFloat = quickLoginBtn.titleLabel!.width
        quickLoginBtn.frame = CGRectMake(ScreenWidth - quickW - 10, CGRectGetMaxY(loginImageView.frame) + 10, quickW, 30)
        quickLoginBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        quickLoginBtn.addTarget(self, action: #selector(HZHLoginViewController.quickLoginClick), forControlEvents: .TouchUpInside)
        quickLoginBtn.setTitle("无账号快捷登录", forState: .Normal)
        quickLoginBtn.setTitleColor(textCoclor, forState: .Normal)
        quickLoginBtn.setTitleColor(UIColor.lightGrayColor(), forState: .Highlighted)
        backScrollView.addSubview(quickLoginBtn)
    }
    
    func addTextFieldToTopViewWiht(textField: UITextField ,frame: CGRect, placeholder: String) {
        textField.frame = frame
        textField.autocorrectionType = .No
        textField.clearButtonMode = .Always
        textField.backgroundColor = UIColor.whiteColor()
        textField.placeholder = placeholder
        topView!.addSubview(textField)
    }
    
    func addBottomView() {
        let forgetPwdImageViewH: CGFloat = 45
        
        bottomView = UIView(frame: CGRectMake((ScreenWidth - loginW) * 0.5, ScreenHeight - forgetPwdImageViewH - 10 - 64, loginW, forgetPwdImageViewH))
        bottomView.backgroundColor = UIColor.clearColor()
        backScrollView.addSubview(bottomView)
        
        forgetPwdImageView = UIImageView()
        addBottomViewWithImageView(forgetPwdImageView, tag: 10, frame: CGRectMake(0, 0, loginW * 0.5, forgetPwdImageViewH), imageName: "c1_1", title: "忘记密码")
        
        registerImageView = UIImageView()
        addBottomViewWithImageView(registerImageView, tag: 11, frame: CGRectMake(bottomView.width * 0.5, 0, loginW * 0.5, forgetPwdImageViewH), imageName: "c1_2", title: "注册")
    }
    
    func addBottomViewWithImageView(imageView: UIImageView, tag: Int, frame: CGRect, imageName: String, title: String) {
        imageView.frame = frame
        imageView.image = UIImage(named: imageName)
        imageView.tag = tag
        imageView.userInteractionEnabled = true
        
        let label = UILabel(frame: CGRectMake(0, 0, imageView.width, imageView.height))
        label.textAlignment = .Center
        label.textColor = textCoclor
        label.text = title
        label.font = UIFont.systemFontOfSize(15)
        imageView.addSubview(label)
        let tap = UITapGestureRecognizer(target: self, action: #selector(HZHLoginViewController.bottomViewColcikWith(_:)))
        imageView.addGestureRecognizer(tap)
        
        bottomView.addSubview(imageView)
        
    }
    
    /// 底部忘记密码和注册按钮点击
    func bottomViewColcikWith(tap: UIGestureRecognizer) {
        if tap.view!.tag == 10 { // 忘记密码
            print("忘记密码", terminator: "")
        } else {                 // 注册
            print("注册", terminator: "")
            SVProgressHUD.showErrorWithStatus("直接登录就行...没有注册功能", maskType: .Black)
        }
    }
    
    /// 登录按钮被点击
    func loginClick() {
        
        if !phoneTextField.text!.validateMobile() {
            SVProgressHUD.showErrorWithStatus("请输入11位的正确手机号", maskType: SVProgressHUDMaskType.Black)
            return
        } else if psdTextField.text!.isEmpty {
            SVProgressHUD.showErrorWithStatus("密码不能为空", maskType: SVProgressHUDMaskType.Black)
            return
        }
        
        let apiRequest = API()
        let dics : NSDictionary = ["phone":phoneTextField.text! , "user_password" : psdTextField.text! , "platform_id" : "2" , "language_abbreviation" : "zh" ]
        
        apiRequest.requestDataWith(APINameLogin, dic: dics as? [String : AnyObject]) { (jsonData, errorMsg) -> () in
            if errorMsg != nil {
                print(errorMsg)
            }else{
                //返回信息为nil表示成功
                
                self.saveCountAndPassword()
                
                let userInfo: NSDictionary? = jsonData!["user_info"] as? NSDictionary
                if (userInfo != nil) {
                    //创建数据模型
                    self.LoginModel = HZHLoginModel.mj_objectWithKeyValues(userInfo)
                   
                    let SessionId = self.LoginModel!.session_id
                    NSUserDefaults.standardUserDefaults().setObject(SessionId, forKey: UserDefaultsSessionId)
                    
                }
            }
            
        }
        

    }
    //登录
    func requestData(){
        
        let apiRequest = API()
        let dics : NSDictionary = ["phone":"15895523287" , "user_password" : "111111" , "platform_id" : "2" , "language_abbreviation" : "zh" ]
        
        apiRequest.requestDataWith(APINameLogin, dic: dics as? [String : AnyObject]) { (jsonData, errorMsg) -> () in
            if errorMsg != nil {
                print(errorMsg)
            }else{
                //返回信息为nil表示成功
                self.saveCountAndPassword()
            }
            
        }
        
    }
    /// 快捷登录点击
    func quickLoginClick() {
        requestData()
    }
    // 保存账号密码
    func saveCountAndPassword() {
        //将用户的账号和密码暂时保存到本地,实际开发中光用MD5加密是不够的,需要多重加密
        let account = self.phoneTextField.text
        let Password = self.psdTextField.text
        NSUserDefaults.standardUserDefaults().setObject(account, forKey: UserDefaultsAccount)
        NSUserDefaults.standardUserDefaults().setObject(Password, forKey: UserDefaultsPassword)
        if NSUserDefaults.standardUserDefaults().synchronize() {
            self.navigationController?.popViewControllerAnimated(true)
        }

    }
    
    
    func keyboardWillChangeFrameNotification(note: NSNotification) {
        // TODO 添加键盘弹出的事件
        let userinfo = note.userInfo!
        let rect = userinfo[UIKeyboardFrameEndUserInfoKey]!.CGRectValue
        var boardH = ScreenHeight - rect.origin.y
        if boardH > 0 {
            boardH = boardH + NavigationH
        }
        backScrollView.contentSize = CGSizeMake(0, view.height + boardH)
    }
    
    func backScrollViewTap() {
        view.endEditing(true)
    }
}


