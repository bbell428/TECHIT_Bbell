//
//  Memo.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

struct Memo {
    var id: UUID = UUID()
    var text: String
    var createdAt: Date
    
    var color: UIColor = [.white, .black, .blue, .green, .red].randomElement() ?? .clear
    
    var createdAtString: String {
        createdAt.formatted(date: .numeric, time: .shortened)
    }
}
