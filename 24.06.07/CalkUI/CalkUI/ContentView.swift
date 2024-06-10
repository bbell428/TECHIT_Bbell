//
//  ContentView.swift
//  CalkUI
//
//  Created by 김종혁 on 6/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var number1: Int = 21
    @State var number2: Int = 14
    @State var result: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Button("-") {
                    // - 버튼을 누르면 해야할 일
                    number1 = number1 - 1
                }
                Spacer() // 풍선마냥 끝으로 밀어줌
                Text("\(number1)")
                Spacer()
                Button("+") {
                    number1 = number1 + 1
                }
            }
            .padding()
            
            HStack {
                Button("-") {
                    // - 버튼을 누르면 해야할 일
                    number2 = number2 - 1
                }
                Spacer() // 풍선마냥 끝으로 밀어줌
                Text("\(number2)")
                Spacer()
                Button("+") {
                    number2 = number2 + 1
                }
            }
            .padding()
            
            Button("Plus") {
                // 덧셈을 누르면 해야 할 일
                result = number1 + number2
            }
            .padding()
            
            Text("\(result)")
                .padding()
        }
        .padding()
        .font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
