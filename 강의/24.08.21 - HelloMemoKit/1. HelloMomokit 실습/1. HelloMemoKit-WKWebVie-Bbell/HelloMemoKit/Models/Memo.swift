
import Foundation

struct Memo {
    var text: String
    var createdAt: Date
    
    var createdAtString: String {
        createdAt.formatted(date: .numeric, time: .shortened)
    }
}
