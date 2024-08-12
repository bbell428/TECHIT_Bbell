//
//  ViewController.swift
//  HelloLyaout
//
//  Created by Jongwook Park on 8/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    var count: Int = 0
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 150)
        
        return label
    }()
    
    let button: UIButton = {
        
        let button: UIButton = UIButton()
        button.setTitle("plus One", for: .normal)
        button.backgroundColor = .systemBlue
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildInterface()
    }
    
    func buildInterface() {
        // AutoLayout을 쓰기 전에 SafeArea 정보 가져오기
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        view.addSubview(label)
        
        button.addTarget(self, action: #selector(plusOne), for: .touchUpInside)
        view.addSubview(button)
        
        // AutoLayout을 쓰겠다고 말해주기
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // label에 제약사항 추가하기
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50)
        ])
    }

    @objc func plusOne() {
        count += 1
        label.text = "\(count)"
    }
}

#Preview {
    ViewController()
}
