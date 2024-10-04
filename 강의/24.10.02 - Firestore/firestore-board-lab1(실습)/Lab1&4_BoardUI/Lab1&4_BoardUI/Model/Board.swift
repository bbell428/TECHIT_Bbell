//
//  Board.swift
//  Lab1&4_BoardUI
//
//  Created by 박준영 on 10/2/24.
//

import Foundation
import FirebaseFirestore

struct Board: Identifiable, Codable {
    var id: String
    var date: Date
    var nickName: String
    var text: String
    var heart: Int
    var comment: [String]
    
    // DateFormatter 생성
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일 HH시 mm분"  // 원하는 형식
        return formatter.string(from: date)
    }
}
