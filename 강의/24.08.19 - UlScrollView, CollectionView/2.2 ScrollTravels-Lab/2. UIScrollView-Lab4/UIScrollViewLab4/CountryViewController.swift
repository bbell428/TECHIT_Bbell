//
//  CountryViewController.swift
//  UIScrollViewLab4
//
//  Created by 김종혁 on 8/19/24.
//

import UIKit

class CountryViewController: CommonViewController {
    
    private lazy var imageView: UIImageView = {
        var image: UIImage = UIImage(named: "Egypt")!
        
        var imageView: UIImageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var countryView: UILabel = {
        let countryView: UILabel = UILabel()
        countryView.text = "Country"
        countryView.textAlignment = .center // 글자를 가운데 정렬
        countryView.font = UIFont.boldSystemFont(ofSize: 24)
        return countryView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.5
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Message"
    }
    
    override func setupSubviews() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(countryView)
        stackView.addArrangedSubview(imageView)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            imageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 450),
        ])
    }
    
    public func setMessage(_ country: String ,_ message: String) {
        imageView.image = UIImage(named: "\(message)")!
        countryView.text = "\(country)"
    }
}

#Preview {
    CountryViewController()
}
