//
//  CalculatorViewModel.swift
//  CaculatorMVVM
//
//  Created by 강승우 on 2024/07/24.
//

import Foundation


class CalculatorViewModel : ObservableObject {
    @Published var calModel : CalculatorModel = CalculatorModel()
    
    var firstNumber : Int {
        get { calModel.firstNumber }
    }
    
    var secondNumber : Int {
        get { calModel.secondNumber }
    }
    
    var resultNumber : String {
        get { calModel.resultNumber }
    }
    
    
    //MARK: ------------------------------------------
    func controlFirstNumber(_ num : Int) {
        calModel.firstNumber += num
    }
    
    func controlSecondNumber(_ num : Int) {
        calModel.secondNumber += num
    }
    
    //MARK: ------------------------------------------
    func calc(_ op : String) {
        switch op {
        case "+" :
            calModel.resultNumber = String(firstNumber + secondNumber)
        case "-" :
            calModel.resultNumber = String(firstNumber - secondNumber)
        case "*" :
            calModel.resultNumber = String(firstNumber * secondNumber)
        case "/" :
            if secondNumber == 0 {
                calModel.resultNumber = "Divide 0"
            } else {
                calModel.resultNumber = String(Double(firstNumber) / Double(secondNumber))
            }
        case "%" :
            calModel.resultNumber = String(firstNumber % secondNumber)
        case "reset" :
            calModel.resultNumber = "0"
            calModel.firstNumber = 0
            calModel.secondNumber = 0
        default :
            return
        }
    }
}
