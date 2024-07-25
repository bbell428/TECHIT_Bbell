//
//  ContentView.swift
//  CaculatorMVVM
//
//  Created by 강승우 on 2024/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var calc : CalculatorViewModel = CalculatorViewModel()
    
    var body: some View {
        VStack(spacing : 100) {
            HStack(spacing : 100) {
                controlButton(calc.controlFirstNumber(_:), -1, "minus")
                
                Text("\(calc.firstNumber)")
                    .font(.system(size: 30))
                
                controlButton(calc.controlFirstNumber(_:), 1, "plus")
            }
            HStack(spacing : 100) {
                controlButton(calc.controlSecondNumber(_:), -1, "minus")
                
                Text("\(calc.secondNumber)")
                    .font(.system(size: 30))
                
                controlButton(calc.controlSecondNumber(_:), 1, "plus")
            }
            HStack(spacing : 70){
                calcButton("+", "plus")
                calcButton("-", "minus")
                calcButton("*", "multiply")
                calcButton("/", "divide")
            }
            HStack(spacing : 70){
                calcButton("%", "percent")
                calcButton("reset", "gobackward")
            }
            
            Text(calc.resultNumber)
                .font(.system(size: 42))
        }
        .padding()
    }
}

extension ContentView {
    func controlButton(_ action : @escaping (_ num : Int) -> Void, _ num : Int, _ op : String) -> some View {
        Button {
            action(num)
        } label : {
            Image(systemName: op)
        }
    }
    
    func calcButton(_ op : String, _ name : String) -> some View {
        Button {
            calc.calc(op)
        } label : {
            Image(systemName: name)
        }
    }
}

#Preview {
    ContentView()
}
