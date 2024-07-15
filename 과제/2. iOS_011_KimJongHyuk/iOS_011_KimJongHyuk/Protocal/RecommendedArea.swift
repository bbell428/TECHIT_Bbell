//
//  TuristArea.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 7/14/24.
//

import Foundation

protocol RecommendedArea: Identifiable {
//    var continent: String {get set} // 대륙
    var country: String {get set} // 나라
    var city: [String] {get set}
}


