//
//  SchoolClass.swift
//  LionSchool
//
//  Created by 김효정 on 6/18/24.
//

import Foundation

// 반
struct SchoolClass: NameExist, CampaignExist, Identifiable {
    var id: UUID = UUID()
    var name: String
    var campaign: String
    var students: [Student]
}
