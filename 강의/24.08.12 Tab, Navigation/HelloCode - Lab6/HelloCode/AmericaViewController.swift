//
//  AmericaViewController.swift
//  HelloCode
//
//  Created by Hyunwoo Shin on 8/12/24.
//

import Foundation
import UIKit

class AmericaViewController: CommonViewController {
    private lazy var greetingLabel: UILabel = setUILabel(text: "Greeting")
    private lazy var vStackView: UIStackView = setVStackView()
    private lazy var subVStackView: UIStackView = setVStackView()
    private lazy var firstCountryHStackView: UIStackView = setHStackView()
    private lazy var secondCountryHStackView: UIStackView = setHStackView()
    private lazy var thirdCountryHStackView: UIStackView = setHStackView()
    private lazy var firstCountryFlagLabel: UILabel = setUILabel(text: "🇺🇸")
    private lazy var secondCountryFlagLabel: UILabel = setUILabel(text: "🇲🇽")
    private lazy var thirdCountryFlagLabel: UILabel = setUILabel(text: "🇧🇷")
    private lazy var firstCountryButton: UIButton = setGreetingButton(title: "USA", tag: 0)
    private lazy var secondCountryButton: UIButton = setGreetingButton(title: "MEXICO", tag: 1)
    private lazy var thirdCountryButton: UIButton = setGreetingButton(title: "BRAZIL", tag: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "AMERICA"
    }
    
    override func setupSubvviews() {
        greetingLabel = setUILabel(text: "Greeting")
        
        firstCountryHStackView.addArrangedSubviews(views: [firstCountryFlagLabel, firstCountryButton])
        secondCountryHStackView.addArrangedSubviews(views: [secondCountryFlagLabel, secondCountryButton])
        thirdCountryHStackView.addArrangedSubviews(views: [thirdCountryFlagLabel, thirdCountryButton])
        
        subVStackView.addArrangedSubviews(views: [firstCountryHStackView, secondCountryHStackView, thirdCountryHStackView])
        
        vStackView.addArrangedSubviews(views: [greetingLabel, subVStackView])
        
        view.addSubviews(views: [vStackView])
        
        NSLayoutConstraint.activate([
            firstCountryButton.widthAnchor.constraint(equalToConstant: 250),
            secondCountryButton.widthAnchor.constraint(equalToConstant: 250),
            thirdCountryButton.widthAnchor.constraint(equalToConstant: 250),
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
            greetingLabel.text = "Hi"
        case 1:
            greetingLabel.text = "¡Hola"
        default:
            greetingLabel.text = "Oi"
        }
    }
    
    override func getGreeting(tag: Int) -> String {
        return switch tag {
        case 0:
            "Hi"
        case 1:
             "¡Hola"
        default:
             "Oi"
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
    AmericaViewController()
}
