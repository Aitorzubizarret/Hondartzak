//
//  AppDelegate.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 11/04/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // Main Coordinator.
    var coordinator: MainCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        ///
        /// COORDINATOR PATTERN.
        /// This only works for iOS 12 and older versions. For iOS 13 and newer go to SceneDelegate.
        ///
        
        // Create and initialize the Navigation Controller.
        let navigationController: UINavigationController = UINavigationController()
        
        // Create the Main Coordinator with the Navigation Controller, and start it.
        coordinator = MainCoordinator(navigationController: navigationController)
        coordinator?.start()
        
        // Create the window and add the Navigation Controller as the root view.
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        if let window = window {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    
    @available (iOS 13, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available (iOS 13, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

