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
    var nameSix: [String] = ["대동경","갓수은","킹종혁","괴물재민","大문성"]
    var nameFive: [String] = ["김승철","이정민","이주노","황인영"]
    
    var title: String = "Like Lion"
    
    var randomSix: String {
        get {
            return nameSix.randomElement()!
        }
    }
    
    func shuffleSix() {
        nameSix.shuffle()
    }
    
    var randomFive: String {
        get {
            return nameFive.randomElement()!
        }
    }
    
    func shuffleFive() {
        nameFive.shuffle()
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
                    Label("Menu", systemImage: "2.circle")
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
                StudentInfoView()
                ForEach(studentStore.nameSix, id: \.self) { name in
                    Text(name)
                }
            }
            Spacer()
            
            Text("오늘의 멋진'\(studentStore.randomSix)'님")
                .font(.largeTitle)
                .bold()
                .padding()
            Divider()
            
            Button(action: {
                studentStore.shuffleSix()
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
                StudentInfoView()
                ForEach(studentStore.nameFive, id: \.self) { name in
                    Text(name)
                }
            }
            Spacer()
            
            Text("오늘의 멋진'\(studentStore.randomFive)'님")
                .font(.largeTitle)
                .bold()
                .padding()
            Divider()
            
            Button(action: {
                studentStore.shuffleFive()
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
    var body: some View {
        Text("\(studentStore.title)의 학생은 \(studentStore.nameSix.count)명")
    }
}


#Preview {
    ContentView()
        .environment(StudentStore())
}
