//
//  ContentView.swift
//  HelloDemo
//
//  Created by Jongwook Park on 9/3/24.
//

import SwiftUI
import Observation

// Model

struct Student: Identifiable {
    var id = UUID()
    var labIndex: Int
    var name: String
}

// ViewModel? -> Model (ObservableObject)
@Observable
class StudentStore {
    var students: [Student] = []
    var query: String = ""
    
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
            if query.isEmpty {
                return true
            } else {
                return $0.name.contains(query)
            }
        }.filter {
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
    @Bindable var studentStore = StudentStore()
    
    @State private var isShowingAlert = false
    @State private var selectedLabIndex: Int = -1
    
    var labsForDisplay: [Int] {
        if selectedLabIndex < 0 {
            return studentStore.labIndexes
        } else {
            return [selectedLabIndex]
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                
                HStack {
                    Rectangle()
                        .frame(width: 5, height: 5)
                        .foregroundColor(.clear)
                    
                    Image(systemName: "magnifyingglass")
                    
                    TextField("Search", text: $studentStore.query)
                    
                    if !studentStore.query.isEmpty {
                        Button("Clear") {
                            studentStore.query = ""
                        }
                    }
                    
                    Rectangle()
                        .frame(width: 5, height: 5)
                        .foregroundColor(.clear)
                }
                .padding(5)
                
                Divider()
                
                ScrollView(.horizontal) {
                    HStack {
                        Rectangle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(.clear)
                        
                        Button {
                            selectedLabIndex = -1
                        } label: {
                            if selectedLabIndex < 0 {
                                Text("전체")
                                    .padding()
                                    .border(Color.gray, width: 1)
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .padding(3)
                            } else {
                                Text("전체")
                                    .padding()
                                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                    .padding(3)
                            }
                        }
                        ForEach(studentStore.labIndexes, id: \.self) { index in
                            Button {
                                if selectedLabIndex == index {
                                    selectedLabIndex = -1
                                } else {
                                    selectedLabIndex = index
                                }
                            } label: {
                                if selectedLabIndex == index {
                                    Text("\(index)조")
                                        .padding()
                                        .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.white)
                                        .background(Color.blue)
                                        .padding(3)
                                } else {
                                    Text("\(index)조")
                                        .padding()
                                        .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                        .padding(3)
                                }
                            }
                        }
                    }
                }
                
                List {
                    ForEach(labsForDisplay, id: \.self) { index in
                        Section("\(index)조") {
                            ForEach(studentStore.studentsForLab(index)) { student in
                                Text(student.name)
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        studentStore.shuffle()
                    } label: {
                        Label("Shuffle", systemImage: "shuffle")
                    }
                    
                    Spacer()
                    
                    
                    Button {
                        isShowingAlert.toggle()
                    } label: {
                        Label("Pick", systemImage: "scope")
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
