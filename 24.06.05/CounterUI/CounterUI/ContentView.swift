//
//  ContentView.swift
//  CounterUI
//
//  Created by 김종혁 on 6/5/24.
//

import SwiftUI

struct ContentView: View {
    
    // count가 바뀌면 새로운 상태라고 생각한다.
    @State var count: Int = 0
    
    // 상태가 바뀌면 body는 새롭게 그려진다.
    var body: some View {
        VStack {
            // 새롭게 그려질 때마다 여기 count도
            // 그때의 count로 보여준다.
            Text("\(count)")
                .font(.largeTitle)
                .padding()
            Button("Plus One") {
                count = count + 1
            }
            .font(.largeTitle)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
