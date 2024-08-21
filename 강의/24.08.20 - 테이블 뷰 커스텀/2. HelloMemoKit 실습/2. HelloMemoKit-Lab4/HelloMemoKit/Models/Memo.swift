//
//  Memo.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import Foundation

struct Memo {
    var text: String
    var createdAt: Date
    
    var displayDate: String {
        get {
            let formetter: DateFormatter = DateFormatter()
            formetter.dateStyle = .medium
            formetter.timeStyle = .short
            return formetter.string(from: createdAt)
        }
    }
}
