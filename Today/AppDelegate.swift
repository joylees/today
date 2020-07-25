//
//  AppDelegate.swift
//  Today
//
//  Created by Joy on 4/14/20.
//  Copyright © 2020 Joy. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        //try? Auth.auth().signOut()
        
//        if Auth.auth().currentUser != nil {
//            window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainTabController")
//        }
        
        
        return true
    }
}



