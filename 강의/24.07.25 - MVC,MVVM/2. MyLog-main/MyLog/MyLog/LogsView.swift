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
                    Text(log.text)
                    Text("\(log.displayDate)")
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

struct AddingLogView: View {
    // isShowingSheet는 Bool의 값 타입이지만,
    // @Binding 프로퍼티 래퍼로, 마치 참조타입처럼
    // View 사이에 서로 같은 값이 되도록 만든다
    @Binding var isShowingSheet: Bool
    
    // logStore는 class로 만들어진 참조타입이라서
    // @Binding은 필요없다
    var logsStore: LogsStore
    
    @State private var text: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $text)
                    .padding()
                
                if !text.isEmpty {
                    Button("Save") {
                        logsStore.addLog(text: text)
                        isShowingSheet.toggle()
                    }
                    .padding()
                }
            }
            .navigationTitle("Add a log")
        }
    }
}

#Preview {
    LogsView()
}
