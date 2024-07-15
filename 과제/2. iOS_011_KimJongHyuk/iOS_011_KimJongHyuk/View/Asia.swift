//
//  ContentView.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 7/14/24.
//

import SwiftUI

struct Asia: View {
    @State var isPresented = false
    @State var asia: [TuristAsia] // 데이터 상태를 State로 선언
    
    var body: some View {
        NavigationStack {
            List(asia) { asia in
                Section("\(asia.country)") {
                    ForEach(asia.city, id: \.self) { city in
                        Text(city)
                    }
                    .font(.system(size: 30))
                }
            }
            .navigationTitle(asia[0].continent.rawValue)
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
            AsiaRecommend(asia: $asia) // 데이터를 바인딩으로 전달
        }
    }
}

#Preview {
    Asia(asia: asia)
}
