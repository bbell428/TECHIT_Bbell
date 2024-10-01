//
//  HappyAPIApp.swift
//  HappyAPI
//
//  Created by 김종혁 on 9/30/24.
//

import SwiftUI

@main
struct HappyAPIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(HappyStore())
        }
    }
}
