//
//  AppDelegate.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 01.12.2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let startViewController = StartViewController()
        let navigationController  = UINavigationController(rootViewController: startViewController)
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        FirebaseApp.configure()
            return true
        }
        
    }

 

