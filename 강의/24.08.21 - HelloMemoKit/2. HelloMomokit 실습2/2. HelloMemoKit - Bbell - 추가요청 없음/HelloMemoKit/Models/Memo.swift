//
//  Memo.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import Foundation

struct Memo: Identifiable {
    var id: UUID = UUID()
    var text: String
    var createdAt: Date
    
    var createdAtString: String {
        createdAt.formatted(date: .numeric, time: .shortened)
    }
}
