//
//  StudentView.swift
//  LionSchool
//
//  Created by 김효정 on 6/18/24.
//

import SwiftUI

struct StudentView: View {
    let schoolClass: SchoolClass
    
    var body: some View {
        Section() {
            Text("\(schoolClass.name) - \(schoolClass.campaign)")
                .font(.title3)
                .foregroundStyle(.orange)
            
            ForEach(schoolClass.students) { student in
                VStack(alignment: .leading) {
                    Text("\(student.name)")
                        .font(.title)
                        .foregroundColor(.blue)
                    Text("MBTI: \(student.mbti)")
                    Text("별자리: \(student.star)")
                    Text("장기: \(student.talent)")
                }
            }
        }
    }
}

#Preview {
    List {
        StudentView(schoolClass: mySchool.levels.first!.schoolClasses.first!)
    }
}
