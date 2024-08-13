//
//  ViewController.swift
//  HelloCode
//
//  Created by Jongwook Park on 8/12/24.
//

import UIKit

class ViewController: CommonViewController {
    
    let countries : [String] = ["Korea", "Japan", "China"]
    let Greeting : [String:String] = ["Korea":"안녕하세요", "Japan":"곤니치와", "China":"니하오"]
    let emoji : [String] = ["🇰🇷", "🇯🇵", "🇨🇳"]
    
    
    func button(_ country : String) -> UIButton {
        let button: UIButton = UIButton()
        button.backgroundColor = UIColor(red: 185/255, green: 136/255, blue: 188/255, alpha: 1)
        button.setTitle(country, for: .normal)
        return button
    }
    
    func emojiLabel(_ emoji : String) -> UILabel {
        let emojiLabel: UILabel = UILabel()
        emojiLabel.backgroundColor = UIColor(red: 185/255, green: 136/255, blue: 188/255, alpha: 1)
        emojiLabel.text = "\(emoji)"
        return emojiLabel
    }
    
    
    let label: UILabel = {
        let label: UILabel = UILabel()
        label.text = "안녕하세요"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupLayout() {
        let stackViewVertical: UIStackView = UIStackView()
        stackViewVertical.axis = .vertical
        stackViewVertical.spacing = 10.5
        view.addSubview(stackViewVertical)
        
        view.addSubview(label)
        
        setupAutoLayout()
        
        NSLayoutConstraint.activate([
            
            stackViewVertical.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackViewVertical.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        for index in 0..<countries.count {
            let country: String = countries[index]
            let button = button(country)
            
            let emojiCountry: String = emoji[index]
            let emoji = emojiLabel(emojiCountry)
            
            let horizontalStack = UIStackView(arrangedSubviews: [emoji, button])
            horizontalStack.axis = .horizontal
            horizontalStack.spacing = 10
            
            
            stackViewVertical.addArrangedSubview(horizontalStack)
            
            button.tag = index
            button.translatesAutoresizingMaskIntoConstraints = false
            
            emoji.tag = index
            emoji.translatesAutoresizingMaskIntoConstraints = false
            
            button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
            
            
        }
    }
    
    @objc func clickButton(_ sender: UIButton) {
        let country: String = countries[sender.tag]
        label.text = "\(Greeting["\(country)"] ?? "")"
    }
}

#Preview {
    ViewController()
}
