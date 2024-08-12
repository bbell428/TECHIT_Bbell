//
//  ViewController.swift
//  hwaCdoC
//
//  Created by Soom on 8/9/24.
//

import UIKit

class ViewController: UIViewController {
    var count: Int = 0
    var temperature: Float = 0.0
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "썹씨 온도 입력"
        textField.font = .systemFont(ofSize: 30)
        
        return textField
    }()
    
    let results: UILabel = {
        let results = UILabel()
        results.text = "0"
        results.font = .systemFont(ofSize: 40)
        
        return results
    }()
    
    let button: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("섭씨 -> 화씨", for: .normal)
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
       
        button.addTarget(self, action: #selector(hawCdoC), for: .touchUpInside)
        view.addSubview(button)
        view.addSubview(results)
        view.addSubview(textField)
        
        // AutoLayout을 쓰겠다고 말해주기
        textField.translatesAutoresizingMaskIntoConstraints = false
        results.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // label에 제약사항 추가하기
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            
            results.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            results.bottomAnchor.constraint(equalTo:textField.topAnchor, constant:  0),

            button.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            button.topAnchor.constraint(equalTo: textField.bottomAnchor , constant: 10),
        ])
    }

    @objc func hawCdoC(){
        results.text = "화씨: \(((Float(textField.text ?? "0") ?? 0)   * 9/5) + 32)"
        textField.text = ""
    }
}

#Preview {
    ViewController()
}

