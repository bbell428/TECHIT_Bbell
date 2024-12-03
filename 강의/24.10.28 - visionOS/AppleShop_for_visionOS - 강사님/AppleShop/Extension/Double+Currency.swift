//
//  Double+Currency.swift
//  AppleShop
//
//  Created by Jongwook Park on 10/28/24.
//

import Foundation

extension Double {
    var currencyString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "KRW"
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

