//
//  CountryManager.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 8/12/24.
//

import Foundation

class CountryManager: NSObject {
    static let instance: CountryManager = CountryManager()
    
    private var country: [Country] = [
        Country(countryName: Countrys.Korea, medal: ["금메달":13, "은메달":9, "동메달":10]),
        Country(countryName: Countrys.China, medal: ["금메달":40, "은메달":27, "동메달":24]),
        Country(countryName: Countrys.Japan, medal: ["금메달":20, "은메달":12, "동메달":13])
    ]
    
    var selectedCountryIndex: Int = -1 {
        didSet {
            NotificationCenter.default.post(name : .countryDidChange, object: nil, userInfo: ["selectedCountryIndex" : selectedCountryIndex])
        }
    }
    var selectedCountry: Country? {
        selectedCountryIndex > -1 ? country[selectedCountryIndex] : nil
    }
    
    func setSelectedCountry(_ member: Int) {
        selectedCountryIndex = member
    }
    
}

extension Notification.Name {
    static let countryDidChange = Notification.Name("countryDidChange")
}
