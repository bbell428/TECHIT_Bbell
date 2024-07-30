//
//  CountryInfoViewController.swift
//  CountryWannaGo
//
//  Created by 홍재민 on 7/30/24.
//

import UIKit

class CountryInfoViewController: UIViewController {
    
    private let memberManager: MemberManager = MemberManager.instance
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setCountryInfoLabels()
    }
    
    private func setCountryInfoLabels() {
        guard let selectedMember = memberManager.selectedMember else {
            setEmptyAllCountryInfoLabels()
            return
        }
        
        let countryInfo = selectedMember.countryInfo
        
        countryNameLabel.text = countryInfo.name
        flagLabel.text = countryInfo.flag
        capitalLabel.text = countryInfo.capital
        greetingLabel.text = countryInfo.greeting
    }
    
    private func setEmptyAllCountryInfoLabels() {
        countryNameLabel.text = ""
        flagLabel.text = ""
        capitalLabel.text = ""
        greetingLabel.text = ""
    }
}
