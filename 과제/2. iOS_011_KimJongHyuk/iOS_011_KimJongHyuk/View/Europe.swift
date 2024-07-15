//
//  ContentView.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 7/14/24.
//

import SwiftUI

struct Europe: View {
    @State var isPresented = false
    @State var europe: [TuristEurope] // 데이터 상태를 State로 선언
    
    var body: some View {
        NavigationStack {
            List(europe) { europe in
                Section("\(europe.country)") {
                    ForEach(europe.city, id: \.self) { city in
                        Text(city)
                    }
                    .font(.system(size: 30))
                }
            }
            .navigationTitle(europe[0].continent.rawValue)
            Spacer()
        }
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text("추천/추가")
        })
        .padding(.bottom, 10)
        .font(.title3)
        .fontWeight(.bold)
        .sheet(isPresented: $isPresented) {
            EuropeRecommend(europe: $europe) // 데이터를 바인딩으로 전달
        }
    }
}

#Preview {
    Europe(europe: europe)
}
