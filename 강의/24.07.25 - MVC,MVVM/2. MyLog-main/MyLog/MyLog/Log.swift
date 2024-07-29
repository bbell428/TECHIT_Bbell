//
//  Log.swift
//  MyLog
//
//  Created by Jongwook Park on 7/25/24.
//

import Foundation

struct Log: Identifiable {
    var id: UUID = UUID()
    
    var text: String
    
    // Log 데이터가 생길 때, 현재 날짜와 시각을 기본으로 담게 한다
    var date: Date = Date()
    
    // 날짜를 더 깔끔하게 보여주기 위한 연산 프로퍼티
    var displayDate: String {
        get {
            let formetter: DateFormatter = DateFormatter()
            formetter.dateStyle = .medium
            formetter.timeStyle = .short
            return formetter.string(from: date)
        }
    }
}
