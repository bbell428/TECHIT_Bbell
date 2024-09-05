//
//  Lab.swift
//  RandomMember
//
//  Created by 김종혁 on 9/4/24.
//

import Foundation

struct LabGroup: Identifiable {
    let id: UUID = UUID()
    let labName: String
    var members: [Member]
}


struct Member: Identifiable {
    let id: UUID = UUID()
    var name: String
}
