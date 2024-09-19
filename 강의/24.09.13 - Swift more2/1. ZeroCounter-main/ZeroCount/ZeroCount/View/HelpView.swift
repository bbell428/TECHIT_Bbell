//
//  HelpView.swift
//  ZeroCount
//
//  Created by Jongwook Park on 2/5/24.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 5, dash: [10, 7]))
                .foregroundColor(.gray)
            
            Text(String(localized: "Touch here for adding a count"))
        }
        .padding()
    }
}

#Preview {
    HelpView()
}
