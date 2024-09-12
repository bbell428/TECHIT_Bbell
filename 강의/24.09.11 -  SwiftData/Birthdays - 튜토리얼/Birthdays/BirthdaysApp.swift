//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by 김종혁 on 9/11/24.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
