//
//  Game.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 7/28/24.
//

import Foundation

struct AiGame: Identifiable {
    var id: UUID = UUID()
    var hand: String
    var imageHand: String
    var handInt: Int
}

struct GameModel {
    var score: Int = 0 // 이긴 점수
    var userChoicesInt: Int = 0 // 유저가 선택한 행동에 대한 번호
    var userChoicesHand: String = "" // 유저가 선택한 행동
    var gameResult: String = "" // 게임 결과 Win/Lose/Again
    var numberTime: Int = 5 // 게임 가능 횟수
    var numberPlay: Int = 0 // 게임한 횟수
    
    var isShowingGame: Bool = false // 게임 끝난 후 sheet 화면
}

// 결과 화면에 보여줄 구조
struct ResultSheet: Identifiable {
    var id: UUID = UUID()
    
    var resultUser: String // 게임 끝난 후 유저가 냈던 결과
    var resultAi: String // 게임 끝난 후 컴퓨터가 냈던 결과
    var resultString: String // 게임 끝난 후 Win/Lose/Again
}
