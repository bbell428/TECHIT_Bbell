//
//  SceneDelegate.swift
//  HelloCode
//
//  Created by Jongwook Park on 8/12/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBarController: UITabBarController = UITabBarController()
        
        let asiaViewController: UINavigationController = .init(rootViewController: AsiaViewController())
        asiaViewController.tabBarItem = UITabBarItem(title: "아시아", image: UIImage(systemName: "1.circle.fill"), tag: 0)
        
        let africaViewController: UINavigationController = .init(rootViewController: AfricaViewController())
        africaViewController.tabBarItem = UITabBarItem(title: "아프리카", image: UIImage(systemName: "2.circle.fill"), tag: 1)
        
        let europeViewController: UINavigationController = .init(rootViewController: EuropeViewController())
        europeViewController.tabBarItem = UITabBarItem(title: "유럽", image: UIImage(systemName: "3.circle.fill"), tag: 2)
        
        let americaViewController: UINavigationController = .init(rootViewController: AmericaViewController())
        americaViewController.tabBarItem = UITabBarItem(title: "아메리카", image: UIImage(systemName: "4.circle.fill"), tag: 3)
        
        let oceaniaViewController: UINavigationController = .init(rootViewController: OceaniaViewController())
        oceaniaViewController.tabBarItem = UITabBarItem(title: "오세아니아", image: UIImage(systemName: "5.circle.fill"), tag: 4)
        
        tabBarController.viewControllers = [ asiaViewController, africaViewController, europeViewController, americaViewController, oceaniaViewController ]
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

