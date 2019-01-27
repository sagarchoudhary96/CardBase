//
//  AppDelegate.swift
//  Blockstack
//
//  Created by Yukan Liao on 03/27/2018.
//

import UIKit
import Blockstack

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        var identifier = "Home"
        
        if !launchedBefore  {
            identifier = "WalkThrough"
        }

        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if launchedBefore && !Blockstack.shared.isUserSignedIn() {
            identifier = "MainView"
        }
        
        let initialViewController = storyboard.instantiateViewController(withIdentifier: identifier)

        if Blockstack.shared.isUserSignedIn() {
            let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBar")
            let connectionVc = storyboard.instantiateViewController(withIdentifier: "Connection")
            tabBarController.addChildViewController(initialViewController)
            tabBarController.addChildViewController(connectionVc)
            let navigationController = UINavigationController(rootViewController: tabBarController)
            self.window?.rootViewController = navigationController
            
        } else {
            self.window?.rootViewController = initialViewController
        }
        self.window?.makeKeyAndVisible()
    }
}

