//
//  OceaniaViewController.swift
//  HelloCode
//
//  Created by Hyunwoo Shin on 8/12/24.
//

import Foundation
import UIKit

class OceaniaViewController: CommonViewController {
    private lazy var greetingLabel: UILabel = setUILabel(text: "Greeting")
    private lazy var vStackView: UIStackView = setVStackView()
    private lazy var subVStackView: UIStackView = setVStackView()
    private lazy var koreaHStackView: UIStackView = setHStackView()
    private lazy var japanHStackView: UIStackView = setHStackView()
    private lazy var chinaHStackView: UIStackView = setHStackView()
    private lazy var koreaFlagLabel: UILabel = setUILabel(text: "🇦🇺")
    private lazy var japanFlagLabel: UILabel = setUILabel(text: "🇳🇿")
    private lazy var chinaFlagLabel: UILabel = setUILabel(text: "🇫🇯")
    private lazy var koreaButton: UIButton = setGreetingButton(title: "AUSTRALIA", tag: 0)
    private lazy var japanButton: UIButton = setGreetingButton(title: "NEW ZEALAND", tag: 1)
    private lazy var chinaButton: UIButton = setGreetingButton(title: "FIJI", tag: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "OCEANIA"
    }
    
    override func setupSubvviews() {
        greetingLabel = setUILabel(text: "Greeting")
        
        koreaHStackView.addArrangedSubviews(views: [koreaFlagLabel, koreaButton])
        japanHStackView.addArrangedSubviews(views: [japanFlagLabel, japanButton])
        chinaHStackView.addArrangedSubviews(views: [chinaFlagLabel, chinaButton])
        
        subVStackView.addArrangedSubviews(views: [koreaHStackView, japanHStackView, chinaHStackView])
        
        vStackView.addArrangedSubviews(views: [greetingLabel, subVStackView])
        
        view.addSubviews(views: [vStackView])
        
        NSLayoutConstraint.activate([
            koreaButton.widthAnchor.constraint(equalToConstant: 250),
            japanButton.widthAnchor.constraint(equalToConstant: 250),
            chinaButton.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            vStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStackView.widthAnchor.constraint(equalToConstant: 350),
            vStackView.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    private func setGreeting(tag: Int) {
        switch tag {
        case 0:
            greetingLabel.text = "G'day"
        case 1:
            greetingLabel.text = "Hello"
        default:
            greetingLabel.text = "Hi"
        }
    }
    
    override func getGreeting(tag: Int) -> String {
        return switch tag {
        case 0:
            "G'day"
        case 1:
             "Hello"
        default:
             "Hi"
        }
    }
    
    private func setGreetingButton(title: String, tag: Int) -> UIButton {
        let button: UIButton = UIButton()
        
        button.backgroundColor = .orange
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 10
        button.tag = tag
        button.addAction(UIAction { _ in
            //self.setGreeting(tag: tag)
            let greetingViewController: GreetingViewController = GreetingViewController()
            greetingViewController.setGreetingMessage(greetingMessage: self.getGreeting(tag: tag))
            
            self.navigationController?.pushViewController(greetingViewController, animated: true)
        }, for: .touchUpInside)
        
        return button
    }
    
    private func setUILabel(text: String) -> UILabel {
        let label: UILabel = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.text = text
        return label
    }
    
    private func setHStackView() -> UIStackView {
        let stackView: UIStackView = UIStackView()
        
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        return stackView
    }
    
    private func setVStackView() -> UIStackView {
        let stackView: UIStackView = UIStackView()
        
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 15
        
        return stackView
    }
}

#Preview {
    OceaniaViewController()
}
