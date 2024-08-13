//
//  GreetingViewController.swift
//  HelloCode
//
//  Created by Hyunwoo Shin on 8/12/24.
//

import Foundation
import UIKit

class GreetingViewController: CommonViewController {
    private lazy var greetingLabel: UILabel = setUILabel(text: "test")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Greeting"
    }
    
    override func setupSubvviews() {
        view.addSubview(greetingLabel)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greetingLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
        ])
    }
    
    func setGreetingMessage(greetingMessage: String) {
        greetingLabel = setUILabel(text: greetingMessage)
    }
    
    private func setUILabel(text: String) -> UILabel {
        let label: UILabel = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.text = text
        
        return label
    }
}

#Preview {
    GreetingViewController()
}
