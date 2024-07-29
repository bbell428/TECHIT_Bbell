//
//  GameStore.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 7/28/24.
//

import Foundation
import SwiftUI

class GameStore: ObservableObject {
    @Published private(set) var aiGameRandom: AiGame?
    @Published private(set) var gameModel: GameModel = GameModel()
    @Published private(set) var resultSheets: [ResultSheet] = [ResultSheet(resultUser: "", resultAi: "", resultString: "")]
    
    var aiGame: [AiGame] = [
        AiGame(hand: "가위", imageHand: "Scissors", handInt: 1),
        AiGame(hand: "바위", imageHand: "Rock", handInt: 2),
        AiGame(hand: "보", imageHand: "Paper", handInt: 3)
    ]
    
    var userGame: [AiGame] = [
        AiGame(hand: "가위", imageHand: "Scissors", handInt: 3),
        AiGame(hand: "바위", imageHand: "Rock", handInt: 1),
        AiGame(hand: "보", imageHand: "Paper", handInt: 2)
    ]
    
    // 컴퓨터 랜덤 선택
    func aiChoiceRandom() {
        aiGameRandom = aiGame.shuffled().first
    }
        
    // 유저가 선택한 후 이기면 +1점, 비기면 +0 점
    func userChoice(choiceHand: String,choiceInt: Int) {
        if gameModel.numberPlay == 0 {
            resultSheets.removeAll()
        } else if gameModel.numberPlay == 5 {
            return
        }
        
        gameModel.userChoicesHand = choiceHand
        gameModel.userChoicesInt = choiceInt
        
        guard let aiChoice = aiGameRandom else { return }
        if aiChoice.handInt == gameModel.userChoicesInt {
            gameModel.numberPlay += 1
            gameModel.score += 1
            gameModel.gameResult = "Win"
            let resultSheet = ResultSheet(resultUser: "\(choiceHand)", resultAi: "\(aiChoice.imageHand)", resultString: "이겼다")
            resultSheets.append(resultSheet)
        } else if aiChoice.imageHand == choiceHand {
            gameModel.gameResult = "Again"
            gameModel.numberPlay += 1
            let resultSheet = ResultSheet(resultUser: "\(choiceHand)", resultAi: "\(aiChoice.imageHand)", resultString: "비겼다")
            resultSheets.append(resultSheet)
        }
        else {
            gameModel.gameResult = "Lose"
            gameModel.numberPlay += 1
            let resultSheet = ResultSheet(resultUser: "\(choiceHand)", resultAi: "\(aiChoice.imageHand)", resultString: "졌다")
            resultSheets.append(resultSheet)
        }
        
        if gameModel.numberPlay == gameModel.numberTime{
            gameModel.isShowingGame = true
        }
        
    }
    
    // 컴퓨터가 고른 손동작 반환
    var aiGameChoice: String {
        get {
            return aiGameRandom?.imageHand ?? ""
        }
    }
    
    // 유저가 고른 손동작 반환
    var userChoice: String {
        get {
            return gameModel.userChoicesHand
        }
    }
    
    // 게임 플레이 횟수
    var getNumberPlay: Int {
        get {
            return gameModel.numberPlay
        }
    }
    
    // 게임 이긴 횟수
    var gameNumberScore: Int {
        return gameModel.score
    }
    
    // 이겼는지 졌는지 비겼는지 반환
    var gameResultString: String {
        get {
            return gameModel.gameResult
        }
    }
    
    // 게임 가능 횟수 반환
    var numberTiems: Int {
        get {
            return gameModel.numberTime
        }
    }
    
    // 끝난 게임 결과 sheet로 반환
    var isShowingGames: Bool {
        get {
            return gameModel.isShowingGame
        }
    }
    
    // 게임 리셋
    func resultReset() {
        if gameModel.numberPlay == gameModel.numberTime {
            gameModel.isShowingGame = false
            gameModel.numberPlay = 0
            gameModel.gameResult = ""
            gameModel.userChoicesHand = ""
            aiGameRandom?.imageHand = ""
            gameModel.score = 0
            resultSheets.removeAll()
        }
    }
    
}
