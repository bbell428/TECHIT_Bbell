//
//  SchoolView.swift
//  LionSchool
//
//  Created by 김효정 on 6/18/24.
//

import SwiftUI

struct SchoolView: View {
    var body: some View {
        List (mySchool.levels){ level in
            NavigationLink(" \(level.name) \n \(level.grade)") {
                List(level.schoolClasses) { schoolClass in
                    StudentView(schoolClass: schoolClass)
                }
                .navigationTitle("\(level.name)")
            } .font(.title2)
        }
        .navigationTitle("\(mySchool.name)")
    }
}

#Preview {
    NavigationStack {
        SchoolView()
    }
}
