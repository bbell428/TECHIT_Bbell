//
//  mainBoardList.swift
//  Lab1&4_BoardUI
//
//  Created by 박준영 on 10/2/24.
//

import SwiftUI

struct MainBoardList: View {
    @AppStorage("nickName") var nickName : String = ""
    var boardStore = BoardStore()
    @State private var isShowingDetailSheet: Bool = false
    @State private var isShowingAddSheet: Bool = false
    @State private var selectedBoarder: Board = BoardStore.sampleBoarder
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(boardStore.boardDataSorted) { boardList in
                    Button(action: {
                        selectedBoarder = boardList
                        isShowingDetailSheet.toggle()
                    }, label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(boardList.nickName)
                                    .fontWeight(.bold)
                                Spacer()
                                HStack {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                    Text("\(boardList.heart)")
                                }
                            }
                            Text(boardList.formattedDate)
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Text(boardList.text)
                        }
                    })
                }
            }
        }
        .sheet(isPresented: $isShowingAddSheet, content: {
            BoardAddView(isShowingSheet: $isShowingAddSheet, boardStore: boardStore)
        })
        .sheet(isPresented: $isShowingDetailSheet, content: {
            BoardDetailView(boardStore: boardStore, boardDetail: $selectedBoarder, isShowingDetailSheet: $isShowingDetailSheet)
        })
        .onAppear {
            Task {
                await boardStore.fetchBoards()
            }
        }
        .refreshable {
            Task {
                await boardStore.fetchBoards()
            }
        }
        .listStyle(.plain)
        .navigationTitle("Lab 1 & 4 Boards")
        // .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                // ToolbarItem의 Content는 View처럼 하나만 인정!
                Button(action: {
                    isShowingAddSheet.toggle()
                }, label: {
                    Label("Add new sticker", systemImage: "square.and.pencil")
                })
            }
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    Image(systemName: "person.circle")
                    Text("\(nickName)님")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MainBoardList()
    }
}
