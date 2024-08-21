

import Foundation

struct Memo {
    var text: String
    var createdAt: Date
    
    // 날짜를 더 깔끔하게 보여주기 위한 연산 프로퍼티
    var displayDate: String {
        get {
            let formetter: DateFormatter = DateFormatter()
            formetter.dateStyle = .medium
            formetter.timeStyle = .short
            return formetter.string(from: createdAt)
        }
    }
}
