//
//  ContentView.swift
//  PracticeMyLog
//
//  Created by Juno Lee on 7/25/24.
//

import SwiftUI

struct LogsView: View {
    @StateObject var logsStore: LogsStore = LogsStore()
    
    @State var isShowingSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(logsStore.displayLog) { log in
                    Section {
                        HStack{
                            VStack{
                                Text(log.text)
                                Text("\(log.displayDate)")
                            }
                            
                            
                            Spacer()
                            
                            Button(action: {
                                logsStore.removeLog( log )
                             }) {
                             Image(systemName: "trash")
                             .foregroundColor(.red)
                             }
                             .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }.onDelete(perform: { indexSet in
                    guard let first = indexSet.first else { return }
                    logsStore.removeLog( logsStore.displayLog[first] )
                })
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
    
    @Binding var isShowingSheet: Bool
    
    
    var logsStore: LogsStore
    
    @State private var text: String = ""
    @State private var selectedEmotion: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                EmotionPickerView(selectedEmotion: $selectedEmotion)
                
                TextEditor(text: $text)
                    .padding()
                
                if !text.isEmpty {
                    Button("Save") {
                        logsStore.addLog(text:"\(selectedEmotion) \(text)")
                        isShowingSheet.toggle()
                    }
                    .padding()
                }
            }
            .navigationTitle("Add a log")
        }
    }
}

struct EmotionPickerView: View {
    
    @Binding var selectedEmotion: String
    
    let emotions = ["😀","🥹","🥲","🥰","🤬"]
    
    var body: some View {
        Picker("Emotion", selection: $selectedEmotion) {
            ForEach(emotions, id: \.self) { emotion in
                Text(emotion)
                    .font(.largeTitle)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal)
    }
}



#Preview {
    LogsView()
}
