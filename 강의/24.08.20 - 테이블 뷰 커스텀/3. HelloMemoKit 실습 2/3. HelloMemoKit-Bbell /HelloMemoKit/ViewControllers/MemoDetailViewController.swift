//
//  MemoDetailViewController.swift
//  HelloMemoKit
//
//  Created by 김종혁 on 8/20/24.
//

import UIKit

class MemoDetailViewController: CommonViewController {
    
    private lazy var label: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Hello"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Message"
    }
    
    override func setupSubviews() {
        view.addSubview(label)
    }

    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    public func setMessage(_ message: String) {
        label.text = message
    }
}

#Preview {
    MemoDetailViewController()
}

