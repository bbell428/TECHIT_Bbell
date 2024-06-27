//
//  ContentView.swift
//  Operator_UI
//
//  Created by 김종혁 on 6/27/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstNumberField: String = ""
    @State var secondNumberField: String = ""
    @State var resultText: String = ""
    @State var resultPlus: String = ""
    @State var resultMinus: String = ""
    @State var resultMul: String = ""
    @State var resultDiv: String = ""
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                Text("비교: \(resultText)")
                Text("더하기: \(resultPlus)")
                Text("빼기: \(resultMinus)")
                Text("곱하기: \(resultMul)")
                Text("나누기: \(resultDiv)")
            }
            .padding()

            VStack {
                TextField("첫번째 숫자", text: $firstNumberField)
                    .foregroundColor(.black)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .padding()
                
                TextField("두번째 숫자", text: $secondNumberField)
                    .foregroundColor(.black)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .padding()
            } // VStack
            .padding()
            
            Button("결과") {
                result()
            }
        } //Vstact
        .font(.system(size:30))
        
    }
    
    func result() {
        let firstNumber: Int = Int(firstNumberField) ?? 0
        let secondNumber: Int = Int(secondNumberField) ?? 0
        
        if firstNumberField > secondNumberField {
            resultText = "\(firstNumberField) > \(secondNumberField)"
        } else if firstNumberField < secondNumberField {
            resultText = "\(firstNumberField) < \(secondNumberField)"
        } else if firstNumberField == secondNumberField {
            resultText = "\(firstNumberField) = \(secondNumberField)"
        }
        resultPlus = "\(firstNumber + secondNumber)"
        resultMinus = "\(firstNumber - secondNumber)"
        resultMul = "\(firstNumber * secondNumber)"
        resultDiv = "\(firstNumber / secondNumber)"
        
    }
    
}

#Preview {
    ContentView()
}
