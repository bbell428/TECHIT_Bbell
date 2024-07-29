//
//  ReadMeGame.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 7/28/24.
//

import SwiftUI

struct ReadMeGameSheet: View {
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        VStack {
            Text("게임을 알아봅시다.")
                .font(.largeTitle)
                .padding()
            Spacer()
            
            Image("Rock-paper-scissors game")
                .resizable()
                .frame(width: 300, height: 300)
                .padding()
            
            Text("""
            버튼을 누르면 동시에 컴퓨터는 랜덤으로 가위 바위 보 중에 하나를 골라 화면에 함께 나타냅니다.
            
            컴퓨터와 사람이 각각 선택한 가위 바위 보 중에서 누가 이겼는지 화면에 점수와 Win/Lost가 뜹니다.
            """)
            .frame(width: 300)
            .font(.title2)
            
            Spacer()
            Button(action: {
                isShowingSheet = false
            }, label: {
                Text("게임 시작")
                    .fontWeight(.bold)
                    .font(.largeTitle)
            })
        }
    }
}

#Preview {
   GameView()
}

