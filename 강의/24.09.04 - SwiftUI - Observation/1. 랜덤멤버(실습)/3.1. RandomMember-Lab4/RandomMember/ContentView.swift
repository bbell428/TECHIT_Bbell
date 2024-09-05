//
//  ContentView.swift
//  RandomMember
//
//  Created by 김종혁 on 9/4/24.
//

import SwiftUI
import Observation

@Observable
class StudentStore {
    var data: [LabGroup] = [
        LabGroup(labName: "6조", members: [
            Member(name: "김동경"),
            Member(name: "김종혁"),
            Member(name: "김수은"),
            Member(name: "배문성"),
            Member(name: "홍재민")
        ]),
        
        LabGroup(labName: "5조", members: [
            Member(name: "김승철"),
            Member(name: "이정민"),
            Member(name: "이주노"),
            Member(name: "황인영")
        ])
    ]
    
    var title: String = "Like Lion"
    
    func randomMember(lab: String) -> String? {
        let filter = data.filter { $0.labName == lab }

        return filter.first?.members.randomElement()?.name
    }

    func shuffle(lab: Int) {
        data[lab].members.shuffle()
    }
}


struct ContentView: View {
    var body: some View {
        TabView {
            SixView()
                .tabItem {
                    Label("6조", systemImage: "6.circle")
                }
            FiveView()
                .tabItem {
                    Label("5", systemImage: "5.circle")
                }
        }
    }
}

// MARK: 6조 뷰
struct SixView: View {
    
    @Environment (StudentStore.self) var studentStore: StudentStore
    
    var body: some View {
        
        VStack {
            List {
                StudentInfoView(lab: 0)
                ForEach(studentStore.data.filter{ $0.labName == "6조"}) { labGroup in
                    ForEach(labGroup.members) { member in
                        Text(member.name)
                    }
                }
            }
            Spacer()
            
            Text("오늘의 멋진'\(studentStore.randomMember(lab: "6조") ?? "")'님")
                .font(.largeTitle)
                .bold()
                .padding()
            Divider()
            
            Button(action: {
                studentStore.shuffle(lab: 0)
            }, label: {
                Text("눌러봐~")
                    .font(.largeTitle)
                    .bold()
            })
            Divider()
        }
    }
}

// MARK: 5조 뷰
struct FiveView: View {
    
    @Environment (StudentStore.self) var studentStore: StudentStore
    
    var body: some View {
        
        VStack {
            List {
                StudentInfoView(lab: 1)
                ForEach(studentStore.data.filter{ $0.labName == "5조"}) { labGroup in
                    ForEach(labGroup.members) { member in
                        Text(member.name)
                    }
                }
            }
            Spacer()
            
            Text("오늘의 멋진'\(studentStore.randomMember(lab: "5조") ?? "")'님")
                .font(.largeTitle)
                .bold()
                .padding()
            Divider()
            
            Button(action: {
                studentStore.shuffle(lab: 1)
            }, label: {
                Text("눌러봐~")
                    .font(.largeTitle)
                    .bold()
            })
            Divider()
        }
    }
}

// MARK: 서브 뷰
struct StudentInfoView: View {
    @Environment (StudentStore.self) var studentStore: StudentStore
    
    var lab: Int
    
    var body: some View {
        Text("\(studentStore.title)의 \(studentStore.data[lab].labName)")
    }
}


#Preview {
    ContentView()
        .environment(StudentStore())
}
