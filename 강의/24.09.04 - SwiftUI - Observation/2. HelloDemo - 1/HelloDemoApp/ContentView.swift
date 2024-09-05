//
//  ContentView.swift
//  HelloDemo
//
//  Created by Jongwook Park on 9/3/24.
//

import SwiftUI
import Observation

@Observable
class StudentStore {
    var names: [String] = ["Ned", "Tuna", "Lion", "Yoshi"]
    var title: String = "Like Lion"
    
    var pickedMember: String = ""
    
    func pickMember() {
        pickedMember = names.randomElement() ?? ""
    }
    
    func shuffle() {
        names.shuffle()
    }
}

struct ContentView: View {
    // environment로 등록된 내용들중에
    // StudentStore 타입인 것을 가져와서
    // studentStore 변수 인스턴스로 활용하겠다는 뜻
    @Environment(StudentStore.self) var studentStore: StudentStore
    
    var body: some View {
        List {
            StudentInfoView()
            
            ForEach(studentStore.names, id: \.self) { name in
                Text(name)
            }
            
            Button("Shuffle") {
                studentStore.shuffle()
            }
            
            Button("Change title") {
                studentStore.title = "앱스쿨"
            }
        }
    }
}

struct StudentInfoView: View {
    @Environment(StudentStore.self) var studentStore: StudentStore
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(studentStore.title)의 학생은 \(studentStore.names.count)명")
         
            if !studentStore.pickedMember.isEmpty {
                Text("당첨 : \(studentStore.pickedMember)")
            }
            
            Button("추첨") {
                studentStore.pickMember()
            }
        }
    }
}


#Preview {
    ContentView()
        .environment(StudentStore())
}
