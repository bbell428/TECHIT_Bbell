//
//  CommonViewController.swift
//  HelloCode
//
//  Created by Jongwook Park on 8/12/24.
//

import UIKit

class CommonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupSubviews()
        setupLayout()
    }
    
    func setupSubviews() {
        
    }
    
    func setupLayout() {
        for subview in view.subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
