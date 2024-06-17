//
//  ContentView.swift
//  LionSchool
//
//  Created by 이소영 on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            //학교의 학년들을 목록으로 보여주기
            List(mySchool.levels) { level in
                // 화면을 이동할 떄는 button 대신
                //NavigationLink(NavigationStack이 무조건 있어야 함)를 써봅시다
                NavigationLink("\(level.name)") {
                    // NavigationLink응 누르면 나올
                    //SwiftUI 화면 코드
                    // 학년별 호화면 시작
                    List(level.schoolClasses) { schoolClass in
                        NavigationLink("\(schoolClass.name)") {
                            List(schoolClass.students) {
                                student in
                                Text("\(student.name)")
                            }
                            .navigationTitle("\(schoolClass.name)")
                        }
                    }
                    .navigationTitle("\(level.name)")
                    // 학년별 화면 끝
                }
            }
            .navigationTitle("\(mySchool.name)")
        }
        
    }
}

#Preview {
    ContentView()
}
