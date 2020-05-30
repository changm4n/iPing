//
//  User.swift
//  iPing
//
//  Created by kakao on 2020/05/30.
//  Copyright © 2020 changman. All rights reserved.
//

import Foundation
import Combine

let kSavedUserData = "kSavedUserData"
let kUserToken = "kUserToken"
final class Session {
    
    var disposables = Set<AnyCancellable>()
    static var me = Session()
    
    var active: Bool = false
    var id: String = ""
    var name: String = ""
    var avatar: String? = nil
    var deviceToken: String? = nil
    var unreadCount: Int = 0
    var token: String?
    
    func saveToken(token: String) {
        self.token = token
        self.save()
    }
    
    func setValues(user: UserFragment?) {
        guard let user = user else {
            self.active = false
            return
        }
        
        self.id = user.id
        self.name = user.name
        self.unreadCount = user.unReadCount ?? 0
        self.avatar = user.avatar
        self.active = true
    }
    
    init() {
    }
    
    public init (withDic dic: [String : Any]) {
        guard
            let id = dic["id"] as? String,
            let active = dic["active"] as? Bool,
            let name = dic["name"] as? String,
            let unreadCount = dic["unreadCount"] as? Int else {
                self.active = false
                return
        }
        self.id = id
        self.active = active
        self.name = name
        self.unreadCount = unreadCount
        self.avatar = dic["avatar"] as? String
        self.token = dic["token"] as? String
    }
}

extension Session {
    fileprivate func save() {
        UserDefaults.standard.set(self.token, forKey: kUserToken)
        UserDefaults.standard.synchronize()
    }
    
   
    
    public static func removeSavedUser() {
        Session.me.active = false
        UserDefaults.standard.removeObject(forKey: kUserToken)
        UserDefaults.standard.removeObject(forKey: kSavedUserData)
        UserDefaults.standard.synchronize()
    }
    
    public static func fetchToken() -> String? {
        if let token = UserDefaults.standard.object(forKey: kUserToken) as? String {
            return token
        } else {
            return nil
        }
    }
    //
    public static func fetchDeviceKey() -> String {
        if let deviceToken = UserDefaults.standard.object(forKey: "DeviceKey") as? String {
            return deviceToken
        } else {
            return "InvalidDeviceKey"
        }
    }
    
    public static func saveDeviceKey(_ key:String) {
        UserDefaults.standard.set(key, forKey: "DeviceKey")
        UserDefaults.standard.synchronize()
    }
    
    func saveMyProfile() {
        UserDefaults.standard.removeObject(forKey: kSavedUserData)
        var data = [String : AnyObject]()
        
        data["id"] = self.id as AnyObject
        data["active"] = self.active as AnyObject
        data["name"] = self.name as AnyObject
        if let avatar = self.avatar { data["avatar"] = avatar as AnyObject }
        data["token"] = self.token as AnyObject
        data["deviceToken"] = Session.fetchDeviceKey() as AnyObject
        data["unreadCount"] = self.unreadCount as AnyObject
        
        UserDefaults.standard.set(data, forKey: kSavedUserData)
        UserDefaults.standard.synchronize()
        
        Session.me = self
    }
    
    public static func fetchUserFromSavedData() -> Session? {
        guard let savedDic = UserDefaults.standard.object(forKey: kSavedUserData) as? [String:AnyObject] else {
            return nil
        }
        return Session(withDic: savedDic)
    }
    
    //
    //       //MARK: UserProtocol
    //       public func httpHeaders() -> [String:String] {
    //           var defaultHeaders = [String:String]()
    //
    //           if let token = Session.fetchToken() {
    //               defaultHeaders["Authorization"] = token
    //           }
    //           defaultHeaders["pushtoken"] = Session.fetchDeviceKey()
    //
    //           return defaultHeaders
    //       }
}
