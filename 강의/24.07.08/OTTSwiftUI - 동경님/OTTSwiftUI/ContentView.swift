//
//  ContentView.swift
//  OTTSwiftUI
//
//  Created by 김동경 on 2024/07/08.
//

import SwiftUI

struct ContentView: View {
    let ottData = OTT.getData()
    var body: some View {
        NavigationStack {
            List(ottData) { ott in
                NavigationLink {
                    ContentDetailView(detailData: ott.contents)
                } label: {
                    Text(ott.type.rawValue)
                }

            }
            .navigationTitle("넷플릭스")
            
        }
    }
}


struct ContentDetailView: View {
    var detailData: [Content]
    var body: some View {
        List(detailData) { detail in
            NavigationLink {
                Text(detail.description)
            } label: {
                Text(detail.title)
            }

        }
    }
}


#Preview {
    ContentView()
}
