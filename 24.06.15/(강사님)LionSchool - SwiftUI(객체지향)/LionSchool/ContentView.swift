//
//  ContentView.swift
//  LionSchool
//
//  Created by 김종혁 on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //화면이 전환되는 컨테이너 만들기
        NavigationStack {
            //학교의 학년들을 목록으로 보여주기
            List(mySchool.levels) { level in
                
                // 화면을 이동할 때는 Buttn 대신
                // NavigationLink을 써봅시다
                NavigationLink("\(level.name)") {
                    // NavigationLink를 누르면 나옴
                    // SwiftUI 화면(View) 코드
                    
                    // 학년 별 화면 ~~~~~~~~~~~~~~~~~~~~~~~시작
                    List(level.schoolClasses) { schoolClass in
                        Text("\(schoolClass.name)")
                    }
                    .navigationTitle("\(level.name)")
                    
                    // 학년 별 화면 ~~~~~~~~~~~~~~~~~~~~~~~끝
                }
            }
            .navigationTitle("\(mySchool.name)")
            
            
            //            .listStyle(.plain)
        }
    }
}

#Preview {
    ContentView()
}
