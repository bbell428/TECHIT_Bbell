//
//  Log.swift
//  PracticeMyLog
//
//  Created by Juno Lee on 7/25/24.
//

import Foundation

struct Log: Identifiable, Equatable{
    var id: UUID = UUID()
    
    var text: String
    
    var date: Date = Date()
    
    var displayDate: String {
        get {
            let formetter: DateFormatter = DateFormatter()
            formetter.dateStyle = .medium
            formetter.timeStyle = .short
            return formetter.string(from: date)

        }
    }
}
