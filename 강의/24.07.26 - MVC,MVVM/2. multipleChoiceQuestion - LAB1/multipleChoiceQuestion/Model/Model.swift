//
//  Model.swift
//  multipleChoiceQuestion
//
//  Created by 김종혁 on 7/26/24.
//

import Foundation

struct Category: Identifiable {
    var id: UUID = UUID()
    var categoryName: String
    var question: [Question]
}

struct Question: Identifiable {
    var id: UUID = UUID()
    var question: String
    var choice: [String]
    var collect: String
}
