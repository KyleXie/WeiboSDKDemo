//
//  AppDelegate.swift
//  WeiboDemo
//
//  Created by Kyle Xie on 3/13/16.
//  Copyright © 2016 Kyle Xie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WeiboSDKDelegate {

    var window: UIWindow?
    
    let appKey = "2573034015"


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        WeiboSDK.enableDebugMode(true)
        WeiboSDK.registerApp(appKey)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return WeiboSDK.handleOpenURL(url, delegate: self)
    }

    func didReceiveWeiboRequest(request: WBBaseRequest!) {
        if (request.isKindOfClass(WBProvideMessageForWeiboRequest)) {
            
        }
    }
    
    func didReceiveWeiboResponse(response: WBBaseResponse!) {
        if (response.isKindOfClass(WBSendMessageToWeiboResponse)) {
            let message = "响应状态:\(response.statusCode.rawValue)\n响应UserInfo数据:\(response.userInfo)\n原请求UserInfo数据:\(response.requestUserInfo)"
            let alert = UIAlertView(title: "发送结果", message: message, delegate: nil, cancelButtonTitle: "确定")
            alert.show()
        } else if (response.isKindOfClass(WBAuthorizeResponse)) {
            let message = "响应状态: \(response.statusCode.rawValue)\nresponse.userId: \((response as! WBAuthorizeResponse).userID)\nresponse.accessToken: \((response as! WBAuthorizeResponse).accessToken)\n响应UserInfo数据: \(response.userInfo)\n原请求UserInfo数据: \(response.requestUserInfo)"
            let alert = UIAlertView(title: "认证结果", message: message, delegate: nil, cancelButtonTitle: "确定")
            alert.show()
        }
    }

}

