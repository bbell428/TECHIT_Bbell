//
//  SecondViewController.swift
//  HelloCode
//
//  Created by Jongwook Park on 8/12/24.
//

import UIKit

class SecondViewController: CommonViewController {
    
    // lazy:
    // 이 선언이 될때 바로 클로저 실행 결과를 할당하는 게 아니라
    // 실제로 다른 코드에서 button1을 언급하고 활용하려 할 때
    // 클로저를 실행하고 결과를 할당해 쓰게 해준다.
  
    private lazy var imageView: UIImageView = {
        let image: UIImage = UIImage(imageLiteralResourceName: "kame")
        
        let imageView: UIImageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var button1: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .black
        button.setTitle("Hello1", for: .normal)
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .black
        button.setTitle("Hello2", for: .normal)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.5
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 현재 ViewController가 NavigationController 안에 포함되어 나타난다면
        // 각종 설정을 더 할 수 있다.
        self.title = "멍멍이"
    }
    
    override func setupSubviews() {
        view.addSubview(stackView)
        
        // 어느 메서드를 실행할지를 결정하지만, 추가적인 파라미터는 전달하기 어렵다.
        button1.addTarget(self, action: #selector(sayHello), for: .touchUpInside)
        button2.addTarget(self, action: #selector(sayHello), for: .touchUpInside)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            imageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    @objc func sayHello(_ sender: UIButton) {
        let message: String = switch sender {
                            case button1:
                                "Hello \(sender.titleLabel?.text ?? "!")"
                            case button2:
                                "Hi \(sender.titleLabel?.text ?? "!")"
                            default:
                                ""
                            }
        
        // 다음 화면으로 전환
        let nextViewController: SecondDetailViewController = .init()
        nextViewController.setMessage(message)
        navigationController?.pushViewController(nextViewController, animated: true)
    }

}

#Preview {
    SecondViewController()
}
