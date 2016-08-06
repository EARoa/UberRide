//
//  AppDelegate.swift
//  UberRide
//
//  Created by Efrain Ayllon on 8/4/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        appNotification()
        return true
    }
    
    private func appNotification() {
        let yesAction = UIMutableUserNotificationAction()
        yesAction.title = "Yes"
        yesAction.identifier = "yesAction"
        yesAction.authenticationRequired = true
        yesAction.destructive = false
        yesAction.activationMode = .Foreground
        
        let noAction = UIMutableUserNotificationAction()
        noAction.title = "Cancel"
        noAction.identifier = "noAction"
        noAction.authenticationRequired = true
        noAction.destructive = false
        noAction.activationMode = .Background
        
        let actionCategory = UIMutableUserNotificationCategory()
        actionCategory.identifier = "actionCategory"
        actionCategory.setActions([yesAction,noAction], forContext: .Default)
        actionCategory.setActions([yesAction,noAction], forContext: .Minimal)
        
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert,.Badge], categories: [actionCategory])
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        
        if (identifier! == "yesAction"){
            let mainView = self.window?.rootViewController! as! ViewController
            mainView.myDate.hidden = false
            mainView.datePicker.hidden = false
        }
    }
    
    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }
}

