//
//  SceneDelegate.swift
//  HelloScroll
//
//  Created by Jongwook Park on 8/19/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Create the view controllers for each tab
        let boardViewController = BoardViewController()
        boardViewController.tabBarItem = UITabBarItem(title: "Board", image: UIImage(systemName: "checkerboard.rectangle"), tag: 0)
        
        let wideWideViewController = WideWideViewController()
        wideWideViewController.tabBarItem = UITabBarItem(title: "Wide", image: UIImage(systemName: "field.of.view.ultrawide"), tag: 1)
        
        // Wrap each view controller in a UINavigationController
        let boardNavigationController = UINavigationController(rootViewController: boardViewController)
        boardNavigationController.tabBarItem = UITabBarItem(title: "Board", image: UIImage(systemName: "checkerboard.rectangle"), tag: 0)
        
        let wideWideNavigationController = UINavigationController(rootViewController: wideWideViewController)
        wideWideNavigationController.tabBarItem = UITabBarItem(title: "Wide", image: UIImage(systemName: "field.of.view.ultrawide"), tag: 1)
        
        // Create the tab bar controller and set its view controllers
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [boardNavigationController, wideWideNavigationController]
        
        // Set up the window
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}

