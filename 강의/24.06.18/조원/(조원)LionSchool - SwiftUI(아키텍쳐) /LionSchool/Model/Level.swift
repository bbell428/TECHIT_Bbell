//
//  Level.swift
//  LionSchool
//
//  Created by 김효정 on 6/18/24.
//

import Foundation

// 학년
struct Level: NameExist, GradeExist, Identifiable {
    var id: UUID = UUID()
    var name: String
    var grade: String
    var schoolClasses: [SchoolClass]
}
