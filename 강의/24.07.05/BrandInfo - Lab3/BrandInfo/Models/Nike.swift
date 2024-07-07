//
//  Nike.swift
//  BrandInfo
//
//  Created by 김종혁 on 7/5/24.
//

import SwiftUI

protocol BrandInfo {
    var name: String {get set}
    var country: String {get set}
    var logoUrl: String {get set}
    var startYear: Int {get set}
    var nowOnSale: Bool {get set}
}


class Brand: BrandInfo, Identifiable {
    var id: UUID = UUID()
    var name: String
    var country: String
    var logoUrl: String
    var startYear: Int
    var nowOnSale: Bool
    
    init(name: String, country: String, logoUrl: String, startYear: Int, nowOnSale: Bool) {
        self.name = name
        self.country = country
        self.logoUrl = logoUrl
        self.startYear = startYear
        self.nowOnSale = nowOnSale
    }
}
