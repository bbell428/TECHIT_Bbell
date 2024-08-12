//
//  ViewController.swift
//  LoginLayout
//
//  Created by 김종혁 on 8/9/24.
//

import UIKit

class ViewController: UIViewController {
    var count: Int = 0
    
    let hTitle: UILabel = {
        let hTitle = UILabel()
        hTitle.text = "우리는 대가족~"
        hTitle.font = .systemFont(ofSize: 40)
        
        return hTitle
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let myImage: UIImage = UIImage(named: "famliy")!
        imageView.image = myImage

        return imageView
        
    }()
    
    
    //    let button: UIButton = {
    //        let button: UIButton = UIButton()
    //        button.setTitle("섭씨 -> 화씨", for: .normal)
    //        button.backgroundColor = .systemBlue
    //        return button
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildInterface()
    }
    
    func buildInterface() {
        // AutoLayout을 쓰기 전에 SafeArea 정보 가져오기
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        //        button.addTarget(self, action: #selector(hawCdoC), for: .touchUpInside)
        //        view.addSubview(button)
        view.addSubview(hTitle)
        view.addSubview(imageView)
        
        // AutoLayout을 쓰겠다고 말해주기
        hTitle.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //        button.translatesAutoresizingMaskIntoConstraints = false
        
        // label에 제약사항 추가하기
        NSLayoutConstraint.activate([
            hTitle.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            hTitle.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: hTitle.topAnchor, constant: 0)
            
            //            button.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            //            button.topAnchor.constraint(equalTo: textField.bottomAnchor , constant: 10),
        ])
    }
    
    //    @objc func hawCdoC(){
    //        results.text = "화씨: \(((Float(textField.text ?? "0") ?? 0)   * 9/5) + 32)"
    //        textField.text = ""
    //    }
}

#Preview {
    ViewController()
}


