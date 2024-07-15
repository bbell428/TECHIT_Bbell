//
//  ContentView.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 7/14/24.
//

import SwiftUI

struct Oceania: View {
    @State var isPresented = false
    @State var oceania: [TuristOceania] // 데이터 상태를 State로 선언
    
    var body: some View {
        NavigationStack {
            List(oceania) { oceania in
                Section("\(oceania.country)") {
                    ForEach(oceania.city, id: \.self) { city in
                        Text(city)
                    }
                    .font(.system(size: 30))
                }
            }
            .navigationTitle(oceania[0].continent.rawValue)
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
            OceaniaRecommend(oceania: $oceania) // 데이터를 바인딩으로 전달
        }
    }
}

#Preview {
    Oceania(oceania: oceania)
}
