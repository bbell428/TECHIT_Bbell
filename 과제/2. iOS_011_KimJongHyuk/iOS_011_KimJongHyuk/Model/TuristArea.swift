//
//  TuristModel.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 7/14/24.
//

import Foundation

// 대륙
enum Continent: String {
    case asia = "아시아"
    case europe = "유럽"
    case northAmerica = "북아메리카"
    case southAmerica = "남아메리카"
    case oceania = "오세아니아"
}

struct TuristAsia: RecommendedArea, Identifiable {
    var id: UUID = UUID()
    var continent: Continent
    var country: String
    var city: [String]
}

struct TuristEurope: RecommendedArea, Identifiable {
    var id: UUID = UUID()
    var continent: Continent
    var country: String
    var city: [String]
}

struct TuristNorthAmerica: RecommendedArea, Identifiable {
    var id: UUID = UUID()
    var continent: Continent
    var country: String
    var city: [String]
}

struct TuristSouthAmerica: RecommendedArea, Identifiable {
    var id: UUID = UUID()
    var continent: Continent
    var country: String
    var city: [String]
}

struct TuristOceania: RecommendedArea, Identifiable {
    var id: UUID = UUID()
    var continent: Continent
    var country: String
    var city: [String]
}
