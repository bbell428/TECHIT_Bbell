//
//  BoardDetailView.swift
//  Lab1&4_BoardUI
//
//  Created by 박준영 on 10/3/24.
//

import SwiftUI

struct BoardDetailView: View {
    var boardStore: BoardStore
    @Binding var boardDetail: Board
    @Binding var isShowingDetailSheet: Bool
    @State private var isShowingEditSheet: Bool = false
    @AppStorage("nickName") var nickName : String = ""
    @State var click: Bool = false
    @State private var isShowDeleteAlert: Bool = false  // 알림창 상태 관리
    @State private var newComment: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("\(boardDetail.nickName)")
                        .font(.title)
                    Spacer()
                    Text("\(boardDetail.formattedDate)")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                    .frame(height: 50)
                
                Text("\(boardDetail.text)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                    .frame(height: 50)
                
                Divider()
                
                HStack {
                    Text("댓글 \(boardDetail.comment.count)개")
                        .font(.title3)
                    
                    Spacer()
                    Button(action: {
                        boardDetail.heart += 1
                        boardStore.updateHeart(board: boardDetail)
                        click.toggle()
                    }, label: {
                        Text("\(boardDetail.heart)")
                            .contentTransition(.numericText())
                            .transaction { t in
                                t.animation = .default
                            }
                        Image(systemName: "heart.fill")
                    })
                    .disabled(click)
                    .tint(.red)
                    .buttonStyle(BorderedProminentButtonStyle())
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding()
                
                if boardDetail.comment.isEmpty {
                    Text("작성된 댓글이 없습니다.")
                        .foregroundStyle(.gray)
                } else {
                    List {
                        ForEach(boardDetail.comment, id: \.self) { comment in
                            Text(comment)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                
                Spacer()
                
                HStack {
                    TextField("댓글을 입력하세요", text: $newComment)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 40)
                    
                    Button(action: {
                        if !newComment.isEmpty {
                            boardDetail.comment.append(newComment)
                            boardStore.updateBoard(board: boardDetail)
                            newComment = ""  // 댓글 추가 후 입력란 초기화
                        }
                    }, label: {
                        Text("생성")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    })
                    .disabled(newComment.isEmpty)  // 댓글 입력란이 비었을 경우 버튼 비활성화
                }
                .padding(.horizontal)
            }
            .padding()
            .onAppear {
                print(boardDetail.comment)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        isShowingDetailSheet.toggle()
                    }, label: {
                        Text("뒤로가기")
                            .foregroundStyle(.blue)
                    })
                }
                
                if nickName == boardDetail.nickName {
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            Button(action: {
                                isShowingEditSheet.toggle()
                            }, label: {
                                Text("수정하기")
                                    .foregroundStyle(.green)
                            })
                            Button(action: {
                                isShowDeleteAlert.toggle()
                            }, label: {
                                Text("삭제하기")
                                    .foregroundStyle(.red)
                            })
                        }
                    }
                }
            }
            .alert(isPresented: $isShowDeleteAlert) {
                Alert(title: Text("게시물 삭제"), message: Text("정말로 삭제하시겠습니까?"), primaryButton: .destructive(Text("삭제")) {
                    boardStore.removeBoard(boardDetail)  // 삭제 실행
                    isShowingDetailSheet.toggle()  // 시트 닫기
                }, secondaryButton: .cancel(Text("취소")))
            }
        }
        .sheet(isPresented: $isShowingEditSheet, content: {
            BoardEditView(boardStore: boardStore, boardDetail: $boardDetail, isShowingEditSheet: $isShowingEditSheet)
        })
    }
}

#Preview {
    BoardDetailView(boardStore: BoardStore(), boardDetail: .constant(BoardStore.sampleBoarder), isShowingDetailSheet: .constant(true))
}
