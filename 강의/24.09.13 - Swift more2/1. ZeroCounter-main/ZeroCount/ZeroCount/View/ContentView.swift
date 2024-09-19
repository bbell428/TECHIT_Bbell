//
//  ContentView.swift
//  ZeroCount
//
//  Created by Jongwook Park on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            CounterView()
                .tabItem {
                    Label(String(localized: "Counter"), systemImage: "number.square.fill")
                }
                .tag(0)
            
            
            HistoryView()
                .tabItem {
                    Label(String(localized: "History"), systemImage: "list.clipboard.fill")
                }
                .tag(1)
            
            HelpView()
                .tabItem {
                    Label(String(localized: "Help"), systemImage: "list.clipboard.fill")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
