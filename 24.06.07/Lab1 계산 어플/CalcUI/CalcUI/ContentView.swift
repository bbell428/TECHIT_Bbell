//
//  ContentView.swift
//  CalcUI
//
//  Created by 이소영 on 6/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var number1: Int = 0
    @State var number2: Int = 0
    @State var result: String = "Result"
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
                TextField("Enter number 1", value: $number1, formatter: NumberFormatter())
                .background(Color(uiColor: .secondarySystemBackground))
                .multilineTextAlignment(.center)

                TextField("Enter number 2", value: $number2, formatter: NumberFormatter())
                .background(Color(uiColor: .secondarySystemBackground))
                .multilineTextAlignment(.center)
            
            HStack {
                Button("-") {
                    result = String(number1 - number2)
                }
                .padding()
                Spacer()
                Button("+") {
                    result = String(number1 + number2)
                }
                Spacer()
                Button("x") {
                    result = String(number1 * number2)
                }
                Spacer()
                Button("/") {
                    if number2 == 0 {
                        isPresented = true
                    } else {
                        result = String(number1 / number2)
                    }
                }
                .alert("\(number1) / \(number2)", isPresented: $isPresented) {
                    Button("OK") {
                        
                    }
                } message: {
                    Text("불가")
                }
                .padding()
            }
            
            Text("\(result)")
                .padding()
            
            Button("RESET") {
                result = "Result"
                number1 = 0
                number2 = 0
            }
        }
        .padding()
        .font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
