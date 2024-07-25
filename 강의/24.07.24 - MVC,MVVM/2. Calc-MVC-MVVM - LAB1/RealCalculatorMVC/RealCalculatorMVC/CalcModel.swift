//
//  CalcModel.swift
//  RealCalculatorMVC
//
//  Created by 홍재민 on 7/24/24.
//

import SwiftUI

struct CalcModel {
    private(set) var firstNumber: Int = 0
    private(set) var secondNumber: Int = 0
    private(set) var result: String = "0"
    private(set) var remain: Double = 0.0
    
    mutating func increaseFirstNumber() {
        firstNumber += 1
    }
    
    mutating func increaseSecondNumber() {
        secondNumber += 1
    }
    
    mutating func decreaseFirstNumber() {
        firstNumber -= 1
    }
    
    mutating func decreaseSecondNumber() {
        secondNumber -= 1
    }
    
    /// 두 숫자를 더해 result 프로퍼티에 저장
    mutating func add() {
        result = "\(firstNumber + secondNumber)"
    }
    
    /// 두 숫자를 빼고 result 프로퍼티에 저장
    mutating func minus() {
        result = "\(firstNumber - secondNumber)"
    }
    
    /// 두 숫자를 곱해 result 프로퍼티에 저장
    mutating func multifly() {
        result = "\(firstNumber * secondNumber)"
    }
    
    /// 두 숫자를 나눠 몫을 result 프로퍼티에 저장 및 나머지는 remain에 저장
    mutating func divide() {
        guard firstNumber != 0, secondNumber != 0 else {
            result = "Can't divide in zero"
            return
        }
        
        result = "\(Double(firstNumber) / Double(secondNumber))"
        remain = Double(firstNumber % secondNumber)
    }
    
    mutating func resetAll() {
        firstNumber = 0
        secondNumber = 0
        result = "0"
        remain = 0.0
    }
}
