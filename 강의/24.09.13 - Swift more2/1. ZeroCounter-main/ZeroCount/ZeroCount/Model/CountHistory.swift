//
//  CountHistory.swift
//  ZeroCount
//
//  Created by Jongwook Park on 2/5/24.
//

import Foundation

// Identifiable 프로토콜은 List에서 하나씩 꺼내 활용하게 도와준다
// Codable 프로토콜은 JSON 인코더와 디코더가 변환에 사용하도록 준비해준다 
// - Encodable, Decodable 통합 프로토콜
struct CountHistory: Identifiable, Codable {
    var id: UUID = UUID()
    var count: Int
    var date: Date = Date() // 매번 새로 만들 때 그 당시 날짜/시각으로 값이 담기게 하는 초기화 할당
    
    var dateString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
            
            return dateFormatter.string(from: date)
        }
    }
}
