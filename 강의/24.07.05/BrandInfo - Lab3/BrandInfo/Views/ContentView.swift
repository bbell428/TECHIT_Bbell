//
//  ContentView.swift
//  BrandInfo
//
//  Created by 김종혁 on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ForEach(brands) { brand in
                NavigationStack {
                    BrandDetail(brand: brand)
                }
                .tabItem { Text("\(brand.name)")}.tag(1)
            }
        }
    }
}

#Preview {
    ContentView()
}
