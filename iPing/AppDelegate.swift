//
//  AppDelegate.swift
//  iPing
//
//  Created by changmin lee on 2020/04/09.
//  Copyright © 2020 changman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in
            if(granted){
                print("user push permitted")
                DispatchQueue.main.async {
                    application.registerForRemoteNotifications()
                }
            } else {
                print("user push not permitted")
            }
        }
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        
        print("APNs device token: \(deviceTokenString)")
    }
    
    // Called when APNs failed to register the device for push notifications
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        // Print the error to console (you should alert the user that registration failed)
        print("APNs registration failed: \(error)")
    }
    
    
    
    // 앱이 '켜져있는 상태'에서 푸시 받았을 때(위의 didReceiveRemoteNotification보다 최신 버전, 7.0), 혹은 백그라운드에서 푸시를 클릭해서 들어왔을 때(앱이 꺼진 상태 제어 불가)
    @available(iOS 7.0, *)
    public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void){
        print("Push notification received: \(userInfo)")
        
        if application.applicationState == UIApplication.State.active{
            print("켜져있는 상태에서 받음")
        } else if  application.applicationState == .background{
            print("background")
            application.applicationIconBadgeNumber = 1
        } else {
            print("푸시 메시지를 클릭하고 들어옴")
            application.applicationIconBadgeNumber = 2
            
            guard let info = userInfo["aps"]
                else {
                    return
            }
            print("info: \(info)")
            
            guard (userInfo["custom"] as? String) != nil else{
                return
            }
            print("custom: \(info)")
        }
    }
    
    
}

