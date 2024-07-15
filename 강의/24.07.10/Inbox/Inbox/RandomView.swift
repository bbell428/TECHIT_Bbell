//
//  RandomView.swift
//  Inbox
//
//  Created by Jongwook Park on 7/10/24.
//

import SwiftUI

struct RandomView: View {
    @State var names: [String] = ["god", "뉴진스", "아이브", "에스파", "스트레이키즈"]
    
    @State var artist: String = ""
    
    @State var winner: String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List(names, id: \.self) { name in
                    Text(name)
                }
                
                Divider()
                
                Button("모든 출연진 계약 취소") {
                    names.removeAll()
                }
                
                Divider()
                
                TextField("새로운 아티스트", text: $artist)
                    .padding()
                
                Button("아티스트 추가") {
                    // artist라는 String을 names에 추가하는 코드
                    names.append(artist)
                    
                    // 새로운 아티스트를 입력받도록 입력창 내용 비우기
                    artist = ""
                }
                
                Divider()
                
                Button {
                    names.shuffle()
                } label: {
                    Text("출연순서 재조정")
                }

                Divider()
                
                Text(winner)
                
                Button {
                    winner = names.randomElement() ?? "(오늘은 결방)"
                } label: {
                    Text("내맘대로 오늘의 1위")
                }
            }
            .navigationTitle("오늘의 뮤직뱅크 출연진")
        }
    }
}

#Preview {
    RandomView()
}
