//
//  Student.swift
//  LionSchool
//
//  Created by 김효정 on 6/18/24.
//

import Foundation

// 학생
struct Student: NameExist, PersonalProperty,  Identifiable {
    var id: UUID = UUID()
    var name: String
    var talent: String
    var mbti: String
    var star: String
    
}
