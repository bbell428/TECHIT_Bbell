//
//  ViewController.swift
//  HelloCode
//
//  Created by Jongwook Park on 8/12/24.
//

import UIKit

class ViewController: CommonViewController {
    
    // lazy:
    // 이 선언이 될때 바로 클로저 실행 결과를 할당하는 게 아니라
    // 실제로 다른 코드에서 button1을 언급하고 활용하려 할 때
    // 클로저를 실행하고 결과를 할당해 쓰게 해준다.
  
    private lazy var imageView: UIImageView = {
        let image: UIImage = UIImage(imageLiteralResourceName: "heart")
        
        let imageView: UIImageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var button1: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Hello1", for: .normal)
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Hello2", for: .normal)
        return button
    }()
    
    private lazy var label: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Hello"
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.5
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupSubviews() {
        view.addSubview(stackView)
        
        // 어느 메서드를 실행할지를 결정하지만, 추가적인 파라미터는 전달하기 어렵다.
        button1.addTarget(self, action: #selector(sayHello), for: .touchUpInside)
        button2.addTarget(self, action: #selector(sayHello), for: .touchUpInside)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            imageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
    }
    
    @objc func sayHello(_ sender: UIButton) {
        // 억지로 어느 버튼인지 확인해서 처리할 방법
        // 이제 버튼마다 인스턴스를 생성해서 이름을 알 수 있기 때문에
        // sender와 직접 비교하면 된다.
        switch sender {
        case button1:
            label.text = "Hello \(sender.titleLabel?.text ?? "!")"
        case button2:
            label.text = "Hi \(sender.titleLabel?.text ?? "!")"
        default:
            break
        }
    }

}

#Preview {
    ViewController()
}
