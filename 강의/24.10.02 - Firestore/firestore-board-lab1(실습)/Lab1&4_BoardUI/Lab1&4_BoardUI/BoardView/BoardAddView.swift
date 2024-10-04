//
//  BoardAddView.swift
//  Lab1&4_BoardUI
//
//  Created by 박준영 on 10/3/24.
//

import SwiftUI

struct BoardAddView: View {
    @Binding var isShowingSheet: Bool
    var boardStore: BoardStore
    @State private var memoText: String = ""
    @AppStorage("nickName") var nickName : String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $memoText)
                
                Spacer()
                
                Button(action: {
                    boardStore.addBoard(text: memoText, nickname: nickName)
                    memoText = ""
                    isShowingSheet.toggle()
                }, label: {
                    Text("생성하기")
                        .frame(width: 300, height: 50)
                })
                .buttonStyle(BorderedProminentButtonStyle())
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .disabled(memoText.isEmpty)
                .padding()
            }
            .padding()
            .navigationTitle("게시글 생성")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        memoText = ""
                        isShowingSheet.toggle()
                    }, label: {
                        Text("취소")
                    })
                }
            }
        }
    }
}

#Preview {
    BoardAddView(isShowingSheet: .constant(true), boardStore: BoardStore())
}
