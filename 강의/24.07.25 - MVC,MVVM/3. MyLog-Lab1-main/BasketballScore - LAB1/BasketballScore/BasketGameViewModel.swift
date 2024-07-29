//
//  BasketGameViewModel.swift
//  BasketballScore
//
//  Created by 김종혁 on 7/25/24.
//

import Foundation

class BasketGameViewModel: ObservableObject {
    @Published private(set) var model: Score = Score()
    
    var firstScore: Int {
        get {
            return model.firstScore
        }
    }
    var secondScore: Int {
        get {
            return model.secondScore
        }
    }
    
    func calcFirstScore(_ number: Int) {
        model.firstScore += number
    }
    func calcSecondScore(_ number: Int) {
        model.secondScore += number
    }
    
}
