//
//  ContentView.swift
//  HappyAPI
//
//  Created by 김종혁 on 9/30/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(HappyStore.self) var happyStore: HappyStore
    
    var body: some View {
        VStack {
            Text(happyStore.happys.data.content)
            Text(happyStore.happys.data.author)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(HappyStore())
}
