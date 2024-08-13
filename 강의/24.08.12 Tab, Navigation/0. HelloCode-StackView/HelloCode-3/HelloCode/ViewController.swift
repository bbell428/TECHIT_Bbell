//
//  ViewController.swift
//  HelloCode
//
//  Created by Jongwook Park on 8/12/24.
//

import UIKit

class ViewController: CommonViewController {
    
    let button1: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Hello1", for: .normal)
        return button
    }()
    
    let button2: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Hello2", for: .normal)
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
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.5
        view.addSubview(stackView)
        
        // 어느 메서드를 실행할지를 결정하지만, 추가적인 파라미터는 전달하기 어렵다.
        button1.addTarget(self, action: #selector(sayHello), for: .touchUpInside)
        button2.addTarget(self, action: #selector(sayHello), for: .touchUpInside)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        
        setupAutoLayout()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    @objc func sayHello(_ sender: UIButton) {
        // 억지로 어느 버튼인지 확인해서 처리할 방법
        // 이제 버튼마다 인스턴스를 생성해서 이름을 알 수 있기 때문에
        // sender와 직접 비교하면 된다.
        switch sender {
        case button1:
            print("Hello \(sender.titleLabel?.text ?? "!")")
        case button2:
            print("Hi \(sender.titleLabel?.text ?? "!")")
        default:
            break
        }
    }

}

#Preview {
    ViewController()
}
