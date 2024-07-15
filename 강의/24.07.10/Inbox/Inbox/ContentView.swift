//
//  ContentView.swift
//  Inbox
//
//  Created by Jongwook Park on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    let mails: [String] = [
        "전화좀 받아요!!",
        "안녕하세요, 좋은 소식 가지고 왔습니다",
        "오늘의 급등주, 회원님들께만 알려드립니다",
        "알 수 없는 로그인이 감지되었습니다"
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                if mails.isEmpty {
                    Image(systemName: "tray")
                        .font(.largeTitle)
                    Text("메일함이 비었습니다.")
                } else {
                    List {
                        ForEach(mails, id: \.self) { mail in
                            Text(mail)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("메일함")
        }
    }
}

#Preview {
    ContentView()
}
