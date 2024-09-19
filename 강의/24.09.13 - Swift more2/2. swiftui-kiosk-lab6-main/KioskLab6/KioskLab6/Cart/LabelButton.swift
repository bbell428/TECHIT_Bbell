//
//  LabelButton.swift
//  KioskLab6
//
//  Created by 김동경 on 2024/09/13.
//



import SwiftUI

struct LabelButton<Content: View>: View {
    
    let action: () -> Void
    let label: Content
    
    
    init(action: @escaping () -> Void, @ViewBuilder label: () -> Content) {
        self.action = action
        self.label = label()
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            label
                .font(.largeTitle)
                .tint(.black)
        }
    }
}
