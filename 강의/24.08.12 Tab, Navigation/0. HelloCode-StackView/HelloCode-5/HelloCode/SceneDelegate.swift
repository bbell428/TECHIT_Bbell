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
        
        // UITabBarController 생성
        let tabBarController: UITabBarController = UITabBarController()
        
        // UITabBarController의 ViewController들 지정
        // UIViewContoller 속성에는 TabBar에 속할 때 어떤 항목 모양으로 나타날지 정하는 내용도 원래 있다!
        let firstViewController: FirstViewController = FirstViewController()
        let fisrtTabImage: UIImage? = UIImage(systemName: "heart.fill")
        firstViewController.tabBarItem = UITabBarItem(title: "하트", image: fisrtTabImage, tag: 0)
        
        let secondViewController: SecondViewController = .init() // 이렇게 해도 됩니다!
        let secondTabImage: UIImage? = UIImage(systemName: "dog.fill")
        secondViewController.tabBarItem = UITabBarItem(title: "멍멍이", image: secondTabImage, tag: 1)
        
        tabBarController.viewControllers = [firstViewController, secondViewController]
        
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

