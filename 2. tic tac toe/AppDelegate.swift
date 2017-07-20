//
//  AppDelegate.swift
//  2. tic tac toe
//
//  Created by Melanija Grunte on 13/07/2017.
//  Copyright © 2017 Melanija Grunte. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.

        let mainWindow = window ?? UIWindow()
        mainWindow.rootViewController = ViewController()
        mainWindow.makeKeyAndVisible()
        window = mainWindow

        return true
    }
}
