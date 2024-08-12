//
//  Model.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 8/12/24.
//

import Foundation

enum Countrys: String {
    case Korea = "대한민국"
    case China = "중국"
    case Japan = "일본"
    
    var emoji: String {
        switch self {
        case .Korea:
            return "🇰🇷"
        case .China:
            return "🇨🇳"
        case .Japan:
            return "🇯🇵"
        }
    }
}

struct Country: Identifiable {
    var id: UUID = UUID()
    var countryName: Countrys
    var medal: [String: Int]
}
