//
//  AppDelegate.swift
//  CreamTower
//
//  Created by Luca Hummel on 12/01/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if  ItemRepository.shared.getAllItems().count == 0 {
            _ = ItemRepository.shared.createItem(name: "Chocolate", price: 200, imageName: "chocolateBall", isBought: true, isSelected: true, type: "flavor")
            _ = ItemRepository.shared.createItem(name: "Life", price: 10, imageName: "lifeBall", isBought: false, isSelected: false, type: "flavor")
            _ = ItemRepository.shared.createItem(name: "Gold", price: 5, imageName: "goldBall", isBought: false, isSelected: false, type: "flavor")
            _ = ItemRepository.shared.createItem(name: "Yellow", price: 50, imageName: "YellowCasca", isBought: true, isSelected: true, type: "cone")
            _ = ItemRepository.shared.createItem(name: "Red", price: 50, imageName: "RedCasca", isBought: true, isSelected: false, type: "cone")
            _ = ItemRepository.shared.createItem(name: "aoba", price: 50, imageName: "YellowCasca", isBought: true, isSelected: false, type: "cone")
            _ = ItemRepository.shared.createItem(name: "Azul", price: 50, imageName: "backBlue", isBought: true, isSelected: true, type: "background")
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


}

