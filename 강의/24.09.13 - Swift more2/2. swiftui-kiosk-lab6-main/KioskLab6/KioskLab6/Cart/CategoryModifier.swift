//
//  categoryModifier.swift
//  KioskLab6
//
//  Created by 김동경 on 2024/09/13.
//

import SwiftUI


struct CategoryModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(radius: 3)
    }
}
