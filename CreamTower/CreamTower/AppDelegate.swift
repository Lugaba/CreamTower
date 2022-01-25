//
//  AppDelegate.swift
//  CreamTower
//
//  Created by Luca Hummel on 12/01/22.
//

import UIKit
import GoogleMobileAds


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        if ItemRepository.shared.getAllItems().count == 0 {
            UserDefaults.standard.set(0, forKey: "Money")
            UserDefaults.standard.set(true, forKey: "Sound")
            for item in itemsData {
                _ = ItemRepository.shared.createItem(name: item.name, price: item.price, imageName: item.imageName, isBought: item.isBought, isSelected: item.isSelected, type: item.type)
            }
        } else if ItemRepository.shared.getAllItems().count < itemsData.count {
            for index in ItemRepository.shared.getAllItems().count..<itemsData.count {
                _ = ItemRepository.shared.createItem(name: itemsData[index].name, price: itemsData[index].price, imageName: itemsData[index].imageName, isBought: itemsData[index].isBought, isSelected: itemsData[index].isSelected, type: itemsData[index].type)
            }
        } else {
            print("CoreData up to date")
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

