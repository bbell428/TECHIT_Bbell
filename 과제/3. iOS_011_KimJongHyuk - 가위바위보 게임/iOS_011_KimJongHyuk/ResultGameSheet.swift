//
//  ReadMeGame.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 7/28/24.
//

import SwiftUI

struct ResultGameSheet: View {
    @Binding var isShowingSheet: Bool
    var gameStore: GameStore
    
    var body: some View {
        Spacer()
        Text("이긴 횟수: \(gameStore.gameNumberScore)")
            .font(.largeTitle)
            .fontWeight(.bold)
        
        ForEach(gameStore.resultSheets) { num in
            HStack {
                Image("\(num.resultUser)")
                    .resizable()
                    .frame(width: 40,  height: 60)
                    .padding()
                Text("VS")
                    .multilineTextAlignment(.leading)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Image("\(num.resultAi)")
                    .resizable()
                    .frame(width: 40,  height: 60)
                    .padding()
                Text("\(num.resultString)")
                    .multilineTextAlignment(.leading)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    
            }
        }
        
        Spacer()
        Button(action: {
            isShowingSheet = false
            gameStore.resultReset() // 게임 초기화
        }, label: {
            Text("게임 다시 하기")
                .fontWeight(.bold)
        })
    }
}

#Preview {
   GameView()
}

