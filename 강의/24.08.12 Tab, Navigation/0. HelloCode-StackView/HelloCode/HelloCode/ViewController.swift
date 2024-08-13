//
//  ViewController.swift
//  HelloCode
//
//  Created by Jongwook Park on 8/12/24.
//

import UIKit

class ViewController: CommonViewController {
    
    let button: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Hello", for: .normal)
        return button
    }()
    
    let label: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Hello"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupLayout() {
        
        view.addSubview(button)
        view.addSubview(label)
        
        // auto layout...
//        button.translatesAutoresizingMaskIntoConstraints = false
//        label.translatesAutoresizingMaskIntoConstraints = false
        
        setupAutoLayout()
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -100)
        ])
    }

}

#Preview {
    ViewController()
}
