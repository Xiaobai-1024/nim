/*
 * Copyright (c) 2021 NetEase, Inc.  All rights reserved.
 * Use of this source code is governed by a MIT license that can be
 * found in the LICENSE file.
 */

import Foundation
import NIMSDK

class FLTInitializeService: FLTService {
    
    weak var nimCore: NimCore?
    
    var flutterVersionName: String?
    
    func serviceName() -> String {
        return ServiceType.LifeCycleService.rawValue
    }
    
    func onMethodCalled(_ method: String, _ arguments: [String : Any], _ resultCallback: ResultCallback) {
        if method == "initialize" {
            initSDK(arguments, resultCallback)
        }else {
            resultCallback.notImplemented()
        }
    }
    
    func register(_ nimCore: NimCore) {
        self.nimCore = nimCore
        nimCore.addService(self)
    }
    
    private func initSDK(_ arguments: [String : Any], _ resultCallback: ResultCallback){
        
        if let config = NIMSDKConfig.yx_model(with: arguments){
            let keyPaths = NIMSDKConfig.getKeyPaths(NIMSDKConfig.self)
            keyPaths.forEach { key, value in
                NIMSDKConfig.shared().setValue(config.value(forKey:key), forKeyPath: key)
            }
        }
        
        if let extras = arguments["extras"] as? [String : Any] {
            flutterVersionName = extras["versionName"] as? String
            if flutterVersionName != nil {
                NIMSDKConfig.shared().flutterSDKVersion = flutterVersionName as! NSString
            }
        }
        
        if let sdkDir = arguments["sdkRootDir"] as? String {
            NIMSDKConfig.shared().setupSDKDir(sdkDir)
        }
        
        if let option = NIMSDKOption.yx_model(with: arguments) {
            NIMSDK.shared().register(with: option)
        }
        
        if let loginInfo = arguments["autoLoginInfo"] as? [String : Any],
           let account = loginInfo["account"] as? String,
           let token = loginInfo["token"] as? String {
            if let authType = arguments["authType"] as? Int {
                let data = NIMAutoLoginData()
                data.account = account
                data.token = token
                data.authType = Int32(authType)
                NIMSDK.shared().loginManager.autoLogin(data)
            } else {
                NIMSDK.shared().loginManager.autoLogin(account, token: token)
            }
        }
        
        if let nosSceneConfig = arguments["nosSceneConfig"] as? [String: Any]{
            let sceneDict = NSMutableDictionary()
            nosSceneConfig.forEach { (key: String, value: Any) in
                if let noScene = NIMNosScene(rawValue: key)?.getScene(){
                    sceneDict.setValue(value, forKey: noScene)
                }
            }
            NIMSDK.shared().sceneDict = NSMutableDictionary()
        }
        resultCallback.result(NimResult.success().toDic())
        
        self.nimCore?.notifyOnInitialized()
    }
    
    func onInitialized() {
    
    }
}
