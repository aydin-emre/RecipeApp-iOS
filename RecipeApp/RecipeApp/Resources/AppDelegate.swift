//
//  AppDelegate.swift
//  RecipeApp
//
//  Created by Emre on 25.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let navigationBarTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 23)]
        let tabBarItemTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]

        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = Color.appColor
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = navigationBarTitleTextAttributes

        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = Color.appColor
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().unselectedItemTintColor = Color.lightGrayColor
        UITabBarItem.appearance().setTitleTextAttributes(tabBarItemTitleTextAttributes, for: .normal)

        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = Color.appColor
            appearance.titleTextAttributes = navigationBarTitleTextAttributes
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBar.appearance().standardAppearance

            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = Color.appColor
            tabBarAppearance.inlineLayoutAppearance.normal.iconColor = Color.lightGrayColor
            tabBarAppearance.inlineLayoutAppearance.normal.titleTextAttributes = tabBarItemTitleTextAttributes
            tabBarAppearance.stackedLayoutAppearance.normal.iconColor = Color.lightGrayColor
            tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = tabBarItemTitleTextAttributes
            tabBarAppearance.compactInlineLayoutAppearance.normal.iconColor = Color.lightGrayColor
            tabBarAppearance.compactInlineLayoutAppearance.normal.titleTextAttributes = tabBarItemTitleTextAttributes

            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}
