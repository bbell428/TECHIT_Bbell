//
//  CountryInfoViewController.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 8/12/24.
//

import UIKit

class CountryInfoViewController: UIViewController {
    private let countryManager: CountryManager = CountryManager.instance
    
    let name: UILabel = {
        let name = UILabel()
        name.text = "나라"
        name.font = .systemFont(ofSize: 20)
        
        return name
    }()
    let flag: UILabel = {
        let flag = UILabel()
        flag.text = "국기"
        flag.font = .systemFont(ofSize: 20)
        
        return flag
    }()
    let medal: UILabel = {
        let medal = UILabel()
        medal.text = "메달"
        medal.font = .systemFont(ofSize: 20)
        medal.numberOfLines = 10
        return medal
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCountryInfoLabels()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setCountryInfoLabels()
    }
    
    private func setCountryInfoLabels() {
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        view.addSubview(name)
        view.addSubview(flag)
        view.addSubview(medal)
        
        name.translatesAutoresizingMaskIntoConstraints = false
        flag.translatesAutoresizingMaskIntoConstraints = false
        medal.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            name.bottomAnchor.constraint(equalTo: flag.topAnchor, constant: -50),
            
            flag.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            flag.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            
            medal.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            medal.topAnchor.constraint(equalTo: flag.bottomAnchor, constant: 50),
        ])
        
        guard let selectedCountry = countryManager.selectedCountry else {
            return
        }
        
        let countryInfo = selectedCountry.countryName
        
        name.text = countryInfo.rawValue
        flag.text = countryInfo.emoji
        
        let orderedMedals = ["금메달", "은메달", "동메달"]
        var allMedalsText = ""
        for medalType in orderedMedals {
            if let count = selectedCountry.medal[medalType] {
                allMedalsText += "\(medalType): \(count)\n"
            }
        }
        
        medal.text = allMedalsText
    }
}

#Preview {
    TabBarViewController()
}
