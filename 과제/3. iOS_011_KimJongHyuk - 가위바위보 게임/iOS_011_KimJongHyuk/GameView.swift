//
//  ContentView.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 7/28/24.
//

import SwiftUI

struct GameView: View {
    @StateObject var gameStore: GameStore = GameStore()
    @State var isShowingSheet: Bool = false
    @State var isShowingGames: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Image("\(gameStore.aiGameChoice)")
                        .resizable()
                        .frame(width: 150,  height: 180)
                }
                .padding()
                
                Text("VS")
                    .font(.system(size: 80))
                    .fontWeight(.bold)
                
                Image("\(gameStore.userChoice)")
                    .resizable()
                    .frame(width: 150,  height: 180)
                
                VStack {
                    HStack {
                        ForEach(gameStore.userGame) { user in
                            Button(action: {
                                gameStore.aiChoiceRandom()
                                gameStore.userChoice(choiceHand: user.imageHand, choiceInt: user.handInt)
                                isShowingGames = gameStore.isShowingGames
                            }, label: {
                                Image("\(user.imageHand)")
                                    .resizable()
                                    .frame(width: 70,  height: 80)
                                    .padding()
                                    .background(Color.gray)
                                    .cornerRadius(60)
                            })
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("\(gameStore.gameResultString)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("\(gameStore.getNumberPlay) / \(gameStore.numberTiems)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Label("Read Me", systemImage: "questionmark.square")
                    }
                }
            }
            .sheet(isPresented: $isShowingSheet) { // 게임 설명서
                ReadMeGameSheet(isShowingSheet: $isShowingSheet)
            }
            .sheet(isPresented: $isShowingGames) { // 게임 종료 후 보이는 결과 화면
                ResultGameSheet(isShowingSheet: $isShowingGames, gameStore: gameStore)
            }
        }
    }
}

#Preview {
    GameView()
}
