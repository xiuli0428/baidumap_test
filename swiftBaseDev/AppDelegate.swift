//
//  AppDelegate.swift
//  swiftBaseDev
//
//  Created by 冷政君 on 2020/11/18.
//  Copyright © 2020 冷政君. All rights reserved.
//

import UIKit

//import BaiduMapAPI_Base

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,BMKGeneralDelegate {
    var window: UIWindow?
//    var lunchBannerView : LunchBannerView!
    var lunchImgArray : Array<Any>?
    var tabBarController : UITabBarController!

    @objc var tempData: NSMutableDictionary?
    let channel : String? = "App Store"//Safari
    #if DEBUG
    let isProduction : Bool = false
    #else
    let isProduction : Bool = true
    #endif
    
    var   mapManager: BMKMapManager?
    
    /**
     联网结果回调
     
     @param iError 联网结果错误码信息，0代表联网成功
     */
    func onGetNetworkState(_ iError: Int32) {
        if 0 == iError {
            NSLog("联网成功")
        } else {
            NSLog("联网失败：%d", iError)
        }
    }
    
    /**
     鉴权结果回调
     
     @param iError 鉴权结果错误码信息，0代表鉴权成功
     */
    func onGetPermissionState(_ iError: Int32) {
        if 0 == iError {
            NSLog("授权成功")
        } else {
            NSLog("授权失败：%d", iError)
        }
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        AMapServices.shared()?.apiKey = gaodeAPIKey
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
//        BMKLocationAuth.sharedInstance()?.checkPermision(withKey: "OxDixzuj7GK2tp3n6dbDxhXanR9iVwVB", authDelegate: self)
//        BMKLocationAuth.sharedInstance()?.setAgreePrivacy(true)
        
//        BMKMapManager.setAgreePrivacy(true)

        
        mapManager = BMKMapManager()
//
        if BMKMapManager.setCoordinateTypeUsedInBaiduMapSDK(BMK_COORD_TYPE.COORDTYPE_BD09LL) {
            NSLog("经纬度类型设置成功")
        } else {
            NSLog("经纬度类型设置失败")
        }
        //启动引擎并设置AK并设置delegate
        if !(mapManager!.start("OxDixzuj7GK2tp3n6dbDxhXanR9iVwVB", generalDelegate: self)) {
            NSLog("启动引擎失败")
        }
        
    
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
   
        
        return true
    }
    

    //获取token 失败
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) { //可选
        print("did Fail To Register For Remote Notifications With Error: %@", error)
    }
    
    //umshare
    //9.0前的方法
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        if UserDefaults.standard.value(forKey: "payType") as! String == "1" {

            return true
        }
        //微信支付
        if UserDefaults.standard.value(forKey: "payType") as! String == "2" {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "weixinzhifu"), object: url)
        }
//        UMSocialManager.default()?.handleOpen(url, sourceApplication: sourceApplication, annotation: annotation)
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
      
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "weixinzhifu"), object: url)
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {

        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
 
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // MARK: 角标重置
        application.applicationIconBadgeNumber = -1
        // MARK: 移除所有远程通知
        // 即将收到的
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        // 已经收到的
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
            
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

