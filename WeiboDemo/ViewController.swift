//
//  ViewController.swift
//  WeiboDemo
//
//  Created by Kyle Xie on 3/13/16.
//  Copyright © 2016 Kyle Xie. All rights reserved.
//

import UIKit
let redirectURI = "https://api.weibo.com/oauth2/default.html"

class ViewController: UIViewController {
    @IBOutlet weak var loginBtn: UIButton!

    @IBAction func onLoginBtn(sender: AnyObject) {
        let request = WBAuthorizeRequest.request() as? WBAuthorizeRequest
        request?.redirectURI = redirectURI
        request?.scope = "all"
        
        WeiboSDK.sendRequest(request)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

