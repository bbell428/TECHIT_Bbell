//
//  ContentView.swift
//  AppleShop
//
//  Created by Jongwook Park on 10/28/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var selectedTabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            NavigationStack {
                ProductListView(productStore: .init(kind: .mac))
            }
            .tabItem {
                Label("Mac", systemImage: "macbook")
            }
            .tag(0)
            
            NavigationStack {
                ProductListView(productStore: .init(kind: .ipad))
            }
            .tabItem {
                Label("iPad", systemImage: "ipad")
            }
            .tag(1)
         
            NavigationStack {
                ProductListView(productStore: .init(kind: .iphone))
            }
            .tabItem {
                Label("iPhone", systemImage: "iphone")
            }
            .tag(2)
         
            NavigationStack {
                ProductListView(productStore: .init(kind: .watch))
            }
            .tabItem {
                Label("Watch", systemImage: "applewatch")
            }
            .tag(3)
     
            NavigationStack {
                ProductListView(productStore: .init(kind: .entertainment))
            }
            .tabItem {
                Label("AirPods", systemImage: "airpods")
            }
            .tag(4)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
