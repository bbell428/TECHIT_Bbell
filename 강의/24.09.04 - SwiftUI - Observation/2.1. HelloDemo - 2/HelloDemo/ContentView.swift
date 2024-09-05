//
//  ContentView.swift
//  HelloDemo
//
//  Created by 김종혁 on 9/4/24.
//

import SwiftUI
import Observation

// Model

struct Student: Identifiable {
    var id = UUID()
    var labIndex: Int
    var name: String
}

// ViewModel?
@Observable
class StudentStore {
    var students: [Student] = []
    
    init() {
#if DEBUG
        students = [
            Student(labIndex: 1, name: "짱구"),
            Student(labIndex: 1, name: "철수"),
            Student(labIndex: 1, name: "유리"),
            Student(labIndex: 1, name: "맹구"),
            Student(labIndex: 1, name: "훈이"),
            
            Student(labIndex: 2, name: "둘리"),
            Student(labIndex: 2, name: "또치"),
            Student(labIndex: 2, name: "도우너"),
            Student(labIndex: 2, name: "희동이"),
            Student(labIndex: 2, name: "고길동"),
            
            Student(labIndex: 3, name: "마리오"),
            Student(labIndex: 3, name: "루이지"),
            Student(labIndex: 3, name: "와리오"),
            Student(labIndex: 3, name: "요시"),
            Student(labIndex: 3, name: "쿠파"),
            Student(labIndex: 3, name: "피치"),
            
            Student(labIndex: 4, name: "피카츄"),
            Student(labIndex: 4, name: "라이츄"),
            Student(labIndex: 4, name: "파이기"),
            Student(labIndex: 4, name: "꼬부기"),
            Student(labIndex: 4, name: "아보크"),
        ]
#endif
    }
    
    var labIndexes: [Int] {
        var result: Set<Int> = []
        
        for student in students {
            result.insert(student.labIndex)
        }
        
        let resultArray: [Int] = Array(result).sorted()

        return resultArray
    }
    
    func studentsForLab(_ index: Int) -> [Student] {
        students.filter {
            $0.labIndex == index
        }
    }
    
    func shuffle() {
        students.shuffle()
    }
    
    func pick() -> Student? {
        students.randomElement()
    }
}

// View
struct ContentView: View {
    var studentStore = StudentStore()
    
    @State private var isShowingAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(studentStore.labIndexes, id: \.self) { index in
                        Section("\(index)조") {
                            ForEach(studentStore.studentsForLab(index)) { student in
                                Text(student.name)
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    Button("섞기") {
                        studentStore.shuffle()
                    }
                    Spacer()
                    Button("추첨") {
                        isShowingAlert.toggle()
                    }
                    Spacer()
                }
            }
            .listStyle(.plain)
            .navigationTitle("Students")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("\(studentStore.pick()?.name ?? "") 당첨!"))
            }
        }
    }
}

#Preview {
    ContentView()
}
