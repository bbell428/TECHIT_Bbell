//
//  ContentView.swift
//  BasketballScore
//
//  Created by 김종혁 on 7/25/24
//

import SwiftUI

struct BacsketGame: View {
    @ObservedObject private(set) var viewModel: BasketGameViewModel = BasketGameViewModel()
    
    var body: some View {
        NavigationStack {
            HStack {
                VStack {
                    Text("\(viewModel.firstScore)")
                        .font(.largeTitle)
                    scoreModifier(backgroundColor: Color.orange, labelText: "+1") {
                        viewModel.calcFirstScore(1)
                    }
                    scoreModifier(backgroundColor: Color.blue, labelText: "+2") {
                        viewModel.calcFirstScore(2)
                    }
                    scoreModifier(backgroundColor: Color.gray, labelText: "-1") {
                        viewModel.calcFirstScore(-1)
                    }
                }
                
                VStack {
                    Text("\(viewModel.secondScore)")
                        .font(.largeTitle)
                    scoreModifier(backgroundColor: Color.orange, labelText: "+1") {
                        viewModel.calcFirstScore(1)
                    }
                    scoreModifier(backgroundColor: Color.blue, labelText: "+2") {
                        viewModel.calcFirstScore(2)
                    }
                    scoreModifier(backgroundColor: Color.gray, labelText: "-1", action: {
                        viewModel.calcSecondScore(-1)
                    })
                    
                }
                .navigationTitle("\(viewModel.firstScore)X\(viewModel.secondScore)")
            }
        }
        
    }
    
    //MARK: 버튼 Action UI
    @ViewBuilder
    func scoreModifier(backgroundColor: Color, labelText: String, action: @escaping () -> ()) -> some View {
        // some(Opaque Type): View라는 프로토콜을 채용하면 전부 return 해줄 수 있다.
        Button(action: {
            action()
        }, label: {
            ZStack {
                Rectangle()
                    .foregroundColor(backgroundColor)
                    .frame(height: 100)
                Text(labelText)
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
            }
        })
    }
}

#Preview {
    BacsketGame()
}
