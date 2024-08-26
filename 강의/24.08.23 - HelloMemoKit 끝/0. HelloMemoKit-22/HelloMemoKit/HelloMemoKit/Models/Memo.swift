//
//  Memo.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

enum MemoEmoji: String, CaseIterable {
    case smile = "😊"
    case sad = "😢"
    case wink = "😉"
    case fun = "🤪"
    case lovely = "😍"
}

struct Memo {
    var id: UUID = UUID()
    var text: String
    var createdAt: Date
    
    var color: UIColor = MemoColor.allCases.randomElement()?.uiColor ?? .clear
    var emoji: MemoEmoji = MemoEmoji.allCases.randomElement() ?? .smile
    
    var createdAtString: String {
        createdAt.formatted(date: .numeric, time: .shortened)
    }
}
