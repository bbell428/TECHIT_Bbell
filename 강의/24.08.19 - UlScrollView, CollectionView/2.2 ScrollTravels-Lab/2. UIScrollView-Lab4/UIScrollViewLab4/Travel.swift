//
//  Travel.swift
//  UIScrollViewLab4
//
//  Created by 김종혁 on 8/19/24.
//

import Foundation
import UIKit

struct Travel: Identifiable {
    var id: UUID = UUID()
    var country: String
    var img: String
}

let nameArray: [String] = ["강승우", "김수은", "김종혁"]

let travel: [Travel] = [
    // 강승우님
    Travel(country: "스페인", img: "spain1"),
    Travel(country: "스페인", img: "spain2"),
    Travel(country: "스페인", img: "spain3"),
    Travel(country: "스페인", img: "spain4"),
    Travel(country: "스페인", img: "spain5"),
    
    // 김수은님
    Travel(country: "시드니", img: "sydney"),
    Travel(country: "이태리", img: "italy"),
    Travel(country: "베네치아", img: "venichia"),
    Travel(country: "미국", img: "usa"),
    Travel(country: "런던", img: "rondonCapture"),
    
    // 김종혁님
    Travel(country: "이집트", img: "Egypt"),
    Travel(country: "일본", img: "Fukuoka"),
    Travel(country: "미국", img: "Hawaii"),
    Travel(country: "미국", img: "NewYork"),
    Travel(country: "일본", img: "Tokyo"),
]
