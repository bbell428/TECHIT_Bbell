//
//  ContentView.swift
//  Inbox
//
//  Created by Jongwook Park on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var movies: [String] = [
        "아저씨",
        "기생중",
        "아이언맨",
        "올드보이",
        "아가씨"
    ]
    @State var randomMovie: String = ""
    @State var textField: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                if movies.isEmpty {
                    Image(systemName: "tray")
                        .font(.largeTitle)
                    Text("메일함이 비었습니다.")
                } else {
                    List {
                        ForEach(movies.indices, id: \.self) { index in
                            if index < 5 {
                                Text("\(index+1). \(movies[index])")
                            } else {
                                Text("\(movies[index])")
                            }
                        }
                    }
                    .listStyle(.plain)
                    .frame(height: 260)
                }
            }
            .navigationTitle("영화")
            Text("\(randomMovie)")
                .font(.title)
                .foregroundStyle(.blue)
                .fontWeight(.bold)
            VStack {
                HStack {
                    Button(action: {
                        movies.shuffle()
                    }, label: {
                        Text("랜덤 순위")
                    })
                    .padding(20)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    
                    Button(action: {
                        randomMovie = ("오늘의 추천 영화: \(movies.randomElement() ?? "")")
                    }, label: {
                        Text("영화 추천")
                    })
                    .padding(20)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                }.padding()
                
                
                Spacer()
                HStack {
                    TextField("Movie Add", text: $textField)
                        .font(.system(size: 30))
                        .multilineTextAlignment(.trailing)
                    
                    Button(action: {
                        movies.append(textField)
                    }, label: {
                        Text("영화 추가")
                    })
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .padding()
                }
                Spacer()
                Button(action: {
                    movies.removeAll()
                    randomMovie = ""
                }, label: {
                    Text("다 삭제")
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
