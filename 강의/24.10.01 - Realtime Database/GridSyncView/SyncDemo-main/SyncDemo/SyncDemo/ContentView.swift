//
//  ContentView.swift
//  SyncDemo
//
//  Created by Jongwook Park on 3/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LightView()
                .tabItem {
                    Label("Light", systemImage: "lightbulb")
                }
            GridMarkView()
                .tabItem {
                    Label("Grid", systemImage: "circle.grid.3x3")
                }
            FiveGameView()
                .tabItem {
                    Label("5x5", systemImage: "circle.grid.3x3.circle")
                }
            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "ellipsis.message.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
