//
//  ContentView.swift
//  OTTSwiftUI
//
//  Created by 김동경 on 2024/07/08.
//

import SwiftUI

struct ContentView: View {
    let ottData = OTT.getData() // [OTT] 
    var body: some View {
        NavigationStack {
            List(ottData) { ott in
                NavigationLink {
                    ContentListView(content: ott.contents, type: ott.type.videoType)
                } label: {
                    Text(ott.type.videoType)
                }

            }
            .navigationTitle("넷플릭스")
        }
    }
}

struct ContentListView: View {
    var content: [Content]
    var type: String
    
    var body: some View {
        List(content) { content in
            NavigationLink {
                ContentDetailView(detailData: content)
            } label: {
                Text(content.title)
            }
        }.navigationTitle(type)
    }
    
}

struct ContentDetailView: View {
    var detailData: Content
    var body: some View {
        VStack {
            AsyncImage(url: detailData.imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            
            Text(detailData.title)
                .font(.title)
            Text(detailData.description)
                .font(.subheadline)
        }
    }
}


#Preview {
    ContentView()
}
