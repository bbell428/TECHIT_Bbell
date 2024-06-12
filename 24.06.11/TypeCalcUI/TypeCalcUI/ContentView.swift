//
//  ContentView.swift
//  TypeCalcUI
//
//  Created by 김종혁 on 6/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstNumberField: String = ""
    @State var secondNumberField: String = ""
    
    @State var resultText: String = "결과"
    
    var body: some View {
        VStack {
            TextField("첫번째 숫자", text: $firstNumberField)
                .keyboardType(.numberPad)
                .padding()
            
            TextField("두번째 숫자", text: $secondNumberField)
                .keyboardType(.numberPad)
                .padding()
            
            VStack(alignment: .leading) {
                Button(action: {
                    // 버튼이 눌렸을 때 처리할 Swift 코드
                    print("덧셈")
                    calculator("+")
                    
                }, label: {
                    // 버튼으로 타나날 내용 - SwiftUI 코드
                    Label("덧셈", systemImage: "plus.square")
                })
                
                Button(action: {
                    print("뺄셈")
                    calculator("-")
                    
                }, label: {
                    Label("뺄셈", systemImage: "minus.square")
                })
                
                Button(action: {
                    print("곱셈")
                    calculator("*")

                }, label: {
                    Label("곱셈", systemImage: "multiply.square")
                })
                
                Button(action: {
                    print("나눗셈")
                    calculator("/")
                    
                }, label: {
                    Label("나눗셈", systemImage: "divide.square")
                })
            }
            
            Text("\(resultText)")
                .padding()
                Spacer()
            
            Button("Reset") {
                firstNumberField = ""
                secondNumberField = ""
                resultText = "결과"
            }
        }
        .font(.largeTitle)
        .padding()
    }
    
    func calculator(_ str: String) {
        let firstNumber: Int = Int(firstNumberField) ?? 0
        let seconNumber: Int = Int(secondNumberField) ?? 0
        var resultNumber: Int = 0
        
        if str == "+" {
            resultNumber = firstNumber + seconNumber
        } else if str == "-" {
            resultNumber = firstNumber - seconNumber
        } else if str == "*" {
            resultNumber = firstNumber * seconNumber
        } else if str == "/" {
            if seconNumber == 0 {
                firstNumberField = ""
                secondNumberField = ""
                resultText = "INF"
                return
            } else {
                resultNumber = firstNumber / seconNumber
            }
        }
        
        resultText = String(resultNumber)
    }
    
}

#Preview {
    ContentView()
}
