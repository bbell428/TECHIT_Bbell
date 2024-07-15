//
//  TuristData.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 7/14/24.
//

import Foundation

var asia: [TuristAsia] = [
    TuristAsia(continent: .asia, country: "일본", city: ["도쿄", "교토"]),
    TuristAsia(continent: .asia, country: "중국", city: ["베이징", "상하이"]),
    TuristAsia(continent: .asia, country: "태국", city: ["방콕", "치앙마이"])
]

var europe: [TuristEurope] = [
    TuristEurope(continent: .europe, country: "프랑스", city: ["파리", "니스"]),
    TuristEurope(continent: .europe, country: "이탈리아", city: ["로마", "베네치아"]),
    TuristEurope(continent: .europe, country: "스페인", city: ["바르셀로나", "마드리드"])
]

var northAmerica: [TuristNorthAmerica] = [
    TuristNorthAmerica(continent: .northAmerica, country: "미국", city: ["뉴욕", "로스앤젤레스"]),
    TuristNorthAmerica(continent: .northAmerica, country: "캐나다", city: ["밴쿠버", "토론토"])
]

var southAmerica: [TuristSouthAmerica] = [
    TuristSouthAmerica(continent: .southAmerica, country: "브라질", city: ["리우데자네이루", "상파울루"])
    
]

var oceania: [TuristOceania] = [
    TuristOceania (continent: .oceania, country: "호주", city: ["시드니", "멜버른"]),
]
