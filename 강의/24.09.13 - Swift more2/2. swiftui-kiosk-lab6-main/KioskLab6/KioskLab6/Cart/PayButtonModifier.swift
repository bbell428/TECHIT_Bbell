//
//  payButtonModifier.swift
//  KioskLab6
//
//  Created by 김동경 on 2024/09/13.
//

import SwiftUI




struct PayButtonModifier: ViewModifier {
    let color: Color
    let selected: Bool
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundStyle(.white)
            .frame(width: 280, height: 280)
            .font(.largeTitle)
            .bold()
            .background(selected ? color : .gray)
            .clipShape(RoundedRectangle(cornerRadius: 18))
        
            
    }
}
