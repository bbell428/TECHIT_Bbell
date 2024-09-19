//
//  Food.swift
//  KioskLab6
//
//  Created by 김종혁 on 9/13/24.
//

import Foundation
import SwiftUI

enum CountryFood: String {
    case all = "전체"
    case korea = "한식"
    case china = "중식"
    case japan = "일식"
    case drink = "음료"
    
}

// 이름, 카테고리, 이미지, 가격
struct Food: Identifiable {
    var id: UUID = UUID()
    var category: CountryFood  // 한/중/일식
    var foodName: String       // 음식 이름
    var imageName: String          // 음식 사진
    var price: Int             // 음식 가격
    
    var image: Image { // 음식 이미지
        Image(imageName)
    }
}


var foods: [Food] = []

let foodCountry = [
    Food(category: .korea, foodName: "비빔밥", imageName: "Bibimbap", price: 12000),
    Food(category: .korea, foodName: "김치", imageName: "Kimchi", price: 2300),
    Food(category: .korea, foodName: "감", imageName: "Persimmon", price: 3000),
    Food(category: .korea, foodName: "김밥", imageName: "RiceRoll", price: 4500),
    Food(category: .korea, foodName: "떡국", imageName: "Tteokguk", price: 5000),
    
    Food(category: .china, foodName: "짬봉", imageName: "1", price: 11000),
    Food(category: .china, foodName: "닭가슴살", imageName: "2", price: 20000),
    Food(category: .china, foodName: "양장피", imageName: "3", price: 40000),
    Food(category: .china, foodName: "짜장면", imageName: "4", price: 14000),
    
    Food(category: .japan, foodName: "오꼬노미야끼", imageName: "Okonomiyaki", price: 12000),
    Food(category: .japan, foodName: "주먹밥", imageName: "Onigiri", price: 13000),
    Food(category: .japan, foodName: "라면", imageName: "Ramen", price: 15000),
    Food(category: .japan, foodName: "초밥", imageName: "Sushi", price: 16000),
    Food(category: .japan, foodName: "타코야키", imageName: "Takokayki", price: 6000),
    
    
    Food(category: .drink, foodName: "맥주", imageName: "Beer", price: 5000),
    Food(category: .drink, foodName: "콜라", imageName: "Coke", price: 3500),
    Food(category: .drink, foodName: "오렌지주스", imageName: "OrangeJuice", price: 2500),
    Food(category: .drink, foodName: "소주", imageName: "Soju", price: 4000),
    Food(category: .drink, foodName: "사이다", imageName: "Sprite", price: 4000),
]



