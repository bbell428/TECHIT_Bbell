//
//  ContentView.swift
//  Lab1&4_BoardUI
//
//  Created by 박준영 on 10/2/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("firstLaunch") var isFirstLaunch: Bool = false
    
    var body: some View {
        if isFirstLaunch {
            MainBoardList()
        } else {
            NewUserView()
        }
    }
}

#Preview {
    ContentView()
}
