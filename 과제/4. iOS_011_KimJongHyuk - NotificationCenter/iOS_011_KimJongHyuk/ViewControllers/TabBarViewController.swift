//
//  TabBarViewController.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 8/12/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        let viewOne = CountrySelectViewController()
        let viewTwo = CountryInfoViewController()
        
        viewOne.title = "Select Country"
        viewTwo.title = "Show Medal"
        
        viewOne.navigationItem.largeTitleDisplayMode = .always
        viewTwo.navigationItem.largeTitleDisplayMode = .always
        
        let navOne = UINavigationController(rootViewController: viewOne)
        let navTwo = UINavigationController(rootViewController: viewTwo)
        
        navOne.navigationBar.prefersLargeTitles = true
        navTwo.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navOne, navTwo], animated: true)
    }


}

#Preview {
    TabBarViewController()
}
