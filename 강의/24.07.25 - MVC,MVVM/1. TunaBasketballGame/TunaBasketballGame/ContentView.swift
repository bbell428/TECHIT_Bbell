//
//  ContentView.swift
//  TunaBasketballGame
//
//  Created by 김종혁 on 7/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var firstTeamScore: Int = 0
    @State private var secondTeamScore: Int = 0

    var body: some View {
        HStack {
            //왼쪽줄
            VStack {
                Text(String(firstTeamScore))
                    .font(.largeTitle)
                scoreModifier(backgroundColor: Color.orange, labelText: "+1") {
                    firstTeamScore += 1
                }
                scoreModifier(backgroundColor: Color.blue, labelText: "+2") {
                    firstTeamScore += 2
                }
                scoreModifier(backgroundColor: Color.gray, labelText: "-1") {
                    firstTeamScore -= 1
                }
            }
            
            //오른쪽줄
            VStack {
                Text(String(secondTeamScore))
                    .font(.largeTitle)
                scoreModifier(backgroundColor: Color.orange, labelText: "+1") {
                    secondTeamScore += 1
                }
                scoreModifier(backgroundColor: Color.blue, labelText: "+2") {
                    secondTeamScore += 2
                }
                scoreModifier(backgroundColor: Color.gray, labelText: "-1") {
                    secondTeamScore -= 1
                }
            }
        }
    }
    
    @ViewBuilder
    func scoreModifier(backgroundColor: Color, labelText: String, completion: @escaping () -> ()) -> some View  {
        
        Button(action: {
            completion()
        }, label: {
            ZStack {
                Rectangle()
                    .frame(height: 100)
                    .foregroundStyle(backgroundColor)
                Text(labelText)
                    .foregroundStyle(Color.white)
                    .font(.title)
            }
        })
    }
    
}

#Preview {
    ContentView()
}
