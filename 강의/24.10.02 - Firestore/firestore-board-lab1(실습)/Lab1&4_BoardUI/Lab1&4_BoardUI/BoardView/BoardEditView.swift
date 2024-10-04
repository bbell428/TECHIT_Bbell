//
//  BoardEditView.swift
//  Lab1&4_BoardUI
//
//  Created by 박준영 on 10/3/24.
//

import SwiftUI

struct BoardEditView: View {
    var boardStore: BoardStore
    @Binding var boardDetail: Board
    @Binding var isShowingEditSheet: Bool
    @State private var memoText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $memoText)
                
                Spacer()
                
                Button(action: {
                    boardDetail.text = memoText
                    boardStore.updateBoard(board: boardDetail)
                    // boardStore.addBoard(text: memoText, nickname: nickName)
                    memoText = ""
                    isShowingEditSheet.toggle()
                }, label: {
                    Text("수정하기")
                        .frame(width: 300, height: 50)
                })
                .buttonStyle(BorderedProminentButtonStyle())
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .disabled(memoText == boardDetail.text)
                .padding()
            }
            .padding()
            .navigationTitle("게시글 수정")
            .onAppear {
                memoText = boardDetail.text
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        memoText = ""
                        isShowingEditSheet.toggle()
                    }, label: {
                        Text("취소")
                    })
                }
            }
        }
    }
}

#Preview {
    BoardEditView(boardStore: BoardStore(), boardDetail: .constant(BoardStore.sampleBoarder), isShowingEditSheet: .constant(true))
}
