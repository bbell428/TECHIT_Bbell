//
//  SearchFieldView.swift
//  Refac
//
//  Created by Jaemin Hong on 9/5/24.
//

import SwiftUI

struct SearchFieldView: View {
    @Binding var query: String
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 5, height: 5)
                .foregroundColor(.clear)
            
            Image(systemName: "magnifyingglass")
            
            TextField("Search", text: $query)
            
            if !query.isEmpty {
                Button("Clear") {
                    query = ""
                }
            }
            
            Rectangle()
                .frame(width: 5, height: 5)
                .foregroundColor(.clear)
        }
        .padding(5)
    }
}
