//
//  AddingLogView.swift
//  MyLog
//
//  Created by 김종혁 on 7/26/24.
//

import SwiftUI

struct AddingLogView: View {
    // isShowingSheet는 Bool의 값 타입이지만,
    // @Binding 프로퍼티 래퍼로, 마치 참조타입처럼
    // View 사이에 서로 같은 값이 되도록 만든다
    @Binding var isShowingSheet: Bool
    
    // logStore는 class로 만들어진 참조타입이라서
    // @Binding은 필요없다
    var logsStore: LogsStore
    
    @State private var text: String = ""
    @State private var emotion: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $text)
                    .padding()
                /*
                 Store 안에 있는 log 인스턴스 데이터가 아니라
                 Log라는 타입 자체가 기본 제공하는 감정들의 타입 프로퍼티를 가져온다.
                 
                 새로운 Log 타입에 의한 인스턴스 데이터가 store에 의해 생기기 전에
                 Log라는 타입 자체에서 제공하는 옵션들을 확인하자!
                 이럴 때 타입 프로퍼티가 유용함.
                 */
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(Log.emotions, id: \.self) { emotion in
                            Button(action: {
                                self.emotion = emotion
                            }, label: {
                                Text(emotion)
                                    .font(.largeTitle)
                                    .padding()
                            })
                            .background(self.emotion == emotion ? Color.accentColor  : Color.clear)
                        }
                    }
                    .padding()
                }
                
                /*
                if !text.isEmpty {
                    Button {
                        logsStore.addLog(text: text)
                        isShowingSheet.toggle()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Submit")
                                .foregroundStyle(Color.secondary)
                            Spacer()
                        }
                        .padding()
                        .background(Color.accentColor)
                    }
                    .padding()
                }
                */
            }
            .navigationTitle("Add a log")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Text("Close")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        logsStore.addLog(text: text, emotion: emotion)
                        isShowingSheet.toggle()
                    } label: {
                        Text("Submit")
                    }
                    .disabled(text.isEmpty)
                }
            }
        }
    }
}

#Preview {
    LogsView()
}
