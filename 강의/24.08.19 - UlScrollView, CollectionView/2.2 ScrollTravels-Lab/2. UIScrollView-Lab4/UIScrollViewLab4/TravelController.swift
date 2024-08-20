//
//  ViewController.swift
//  UIScrollViewLab4
//
//  Created by 김종혁 on 8/19/24.
//

import UIKit

class TravelController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        buildInterface()
    }
    
    func buildInterface() {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .cyan
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
        ])
        
        // 좌우로는 화면 폭을 그대로 쓰면서, 상하로만 스크롤 되도록 만들기
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2500)
        
        // 스크롤 뷰 안에 StackView 만들기
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        scrollView.addSubview(contentStackView)
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        for index in 0...2 {
            // StackView에 Label 추가
            let label = UILabel()
            label.text = "\(nameArray[index])"
            contentStackView.addArrangedSubview(label)
            
            // 다시 작은 scrollView를 만들어서 StackView에 추가
            let miniScrollView = UIScrollView()
            miniScrollView.backgroundColor = .clear // 배경을 투명하게
            miniScrollView.contentSize = CGSize(width: 1024, height: 150)
            //        miniScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 150)
            
            
            miniScrollView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                miniScrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
                miniScrollView.heightAnchor.constraint(equalToConstant: 150)
            ])
            
            contentStackView.addArrangedSubview(miniScrollView)
            
            // 작은 ScrollView 안에 이미지 추가하기
            for index2 in index*5...index*5+4 {
                let imageView = UIImageView()
                imageView.image = UIImage(named: "\(travel[index2].img)")
                imageView.contentMode = .scaleAspectFit // 알아서 최적화
                imageView.frame = CGRect(x: 170 * (index2 % 5), y: 0, width: 150, height: 150)
                miniScrollView.addSubview(imageView)
                
                lazy var button: UIButton = {
                    let button: UIButton = UIButton()
                    button.backgroundColor = .clear
                    button.setTitle("\(travel[index2].img)", for: .normal)
                    button.setTitleColor(.clear, for: .normal)
                    button.tag = index2
                    button.frame = CGRect(x: 170 * (index2 % 5), y: 0, width: 150, height: 150)
//                    button.setImage(UIImage(named: "bubble.left"), for: .normal)
                    return button
                }()
                miniScrollView.addSubview(button)
                button.addTarget(self, action: #selector(sayCountry), for: .touchUpInside)
            }
        }
    }
    @objc func sayCountry(_ sender: UIButton) {
        let message: String = "\(sender.titleLabel?.text ?? "!")"
        let country = travel[sender.tag].country
        
        // 다음 화면으로 전환
        let nextViewController: CountryViewController = .init()
        nextViewController.setMessage(country ,message)
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

#Preview {
    TravelController()
}
