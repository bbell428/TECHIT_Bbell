//
//  DisplayFilterButton.swift
//  Refac
//
//  Created by Jaemin Hong on 9/5/24.
//

import SwiftUI

struct DisplayFilterButton: View {
    var title: String
    var action: () -> Void
    var select: () -> Bool
    
    init(_ title: String, action: @escaping () -> Void, select: @escaping () -> Bool) {
        self.title = title
        self.action = action
        self.select = select
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .border(Color.gray, width: 1)
                .foregroundColor(select() ? .white : .blue)
                .background(select() ? .blue : .white)
                .padding(3)
        }
    }
}
