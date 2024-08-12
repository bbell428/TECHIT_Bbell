//
//  CountrySelectViewController.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 8/12/24.
//

import UIKit

class CountrySelectViewController: UIViewController {
    private let countryManager: CountryManager = CountryManager.instance
    
    let countrylabel: UILabel = {
        let countrylabel = UILabel()
        countrylabel.text = "나라를 선택하세요"
        countrylabel.font = .systemFont(ofSize: 20)
        
        return countrylabel
    }()
    
    let koreaBtn: UIButton = {
        let koreaBtn: UIButton = UIButton()
        koreaBtn.setTitle("한국", for: .normal)
        koreaBtn.backgroundColor = .systemBlue
        koreaBtn.tag = 0
        return koreaBtn
    }()
    let chinaBtn: UIButton = {
        let chinaBtn: UIButton = UIButton()
        chinaBtn.setTitle("중국", for: .normal)
        chinaBtn.backgroundColor = .systemBlue
        chinaBtn.tag = 1
        return chinaBtn
    }()
    let japanBtn: UIButton = {
        let japanBtn: UIButton = UIButton()
        japanBtn.setTitle("일본", for: .normal)
        japanBtn.backgroundColor = .systemBlue
        japanBtn.tag = 2
        return japanBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setSelectedCountryNameLabel()
        
        NotificationCenter.default.addObserver(self, selector: #selector(setSelectedCountryNameLabel), name: .countryDidChange, object: nil)
    }
    
    func buildInterface() {
        // AutoLayout을 쓰기 전에 SafeArea 정보 가져오기
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        view.addSubview(countrylabel)
        
        koreaBtn.addTarget(self, action: #selector(selectedCountry), for: .touchUpInside)
        view.addSubview(koreaBtn)
        chinaBtn.addTarget(self, action: #selector(selectedCountry), for: .touchUpInside)
        view.addSubview(chinaBtn)
        japanBtn.addTarget(self, action: #selector(selectedCountry), for: .touchUpInside)
        view.addSubview(japanBtn)
        
        
        // AutoLayout을 쓰겠다고 말해주기
        countrylabel.translatesAutoresizingMaskIntoConstraints = false
        koreaBtn.translatesAutoresizingMaskIntoConstraints = false
        chinaBtn.translatesAutoresizingMaskIntoConstraints = false
        japanBtn.translatesAutoresizingMaskIntoConstraints = false
        
        // label에 제약사항 추가하기
        NSLayoutConstraint.activate([
            countrylabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            countrylabel.bottomAnchor.constraint(equalTo: koreaBtn.topAnchor, constant: -50),
            
            koreaBtn.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            koreaBtn.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            
            chinaBtn.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            chinaBtn.topAnchor.constraint(equalTo: koreaBtn.bottomAnchor, constant: 50),
            
            japanBtn.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            japanBtn.topAnchor.constraint(equalTo: chinaBtn.bottomAnchor, constant: 50)
        ])
    }
    
    @objc private func selectedCountry(_ sender: UIButton) {
        countryManager.setSelectedCountry(sender.tag)
    }
    
    @objc private func setSelectedCountryNameLabel() {
        guard let selectedCountry = countryManager.selectedCountry else {
            countrylabel.text = "나라를 선택하세요"
            return
        }
        countrylabel.text = "\(selectedCountry.countryName.rawValue) \(selectedCountry.countryName.emoji)"
    }
    
}

#Preview {
    CountrySelectViewController()
}
