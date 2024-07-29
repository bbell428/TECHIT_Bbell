//
//  ContentView.swift
//  MyLog
//
//  Created by Jongwook Park on 7/25/24.
//

import SwiftUI

struct LogsView: View {
    @StateObject var logsStore: LogsStore = LogsStore()
    
    @State var isShowingSheet: Bool = false
    
    var body: some View {
        NavigationStack {
                
            List(logsStore.displayLog) { log in
                Section {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text(log.text)
                            Text(log.displayDate)
                                .font(.caption)
                                .foregroundStyle(Color.accentColor)
                        }
                        Spacer()
                        Text(log.emotion)
                            .font(.largeTitle)
                    }
                }
                .contextMenu {
                    ShareLink(item: log.sharedString)
                        
                    Button {
                        // 클립보드에 복사하기
                        UIPasteboard.general.string = log.sharedString
                    } label: {
                        Label("Copy", systemImage: "doc.on.doc")
                    }
                    
                    Button {
                        logsStore.removeLog(log)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            .navigationTitle("My Log")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Label("Add a log", systemImage: "square.and.pencil")
                    }
                }
            }
            .sheet(isPresented: $isShowingSheet) {
                AddingLogView(isShowingSheet: $isShowingSheet, logsStore: logsStore)
            }
        }
    }
}

#Preview {
    LogsView()
}
