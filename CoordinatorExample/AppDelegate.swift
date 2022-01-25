//
//  AppDelegate.swift
//  CoordinatorExample
//
//  Created by Simon Bogutzky on 13.01.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = self.window else { return false }

        let navigationController = UINavigationController.init()
        
        self.appCoordinator = AppCoordinator(navigationController: navigationController)
        guard let appCoordinator = self.appCoordinator else { return false }

        appCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return true
    }

}

