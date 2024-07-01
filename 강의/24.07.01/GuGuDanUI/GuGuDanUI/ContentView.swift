//
//  ContentView.swift
//  GuGuDanUI
//
//  Created by 김종혁 on 7/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var firstNumber: Int = Int.random(in: 2...9)
    @State var secondNumber: Int = Int.random(in: 1...9)
    @State var result: Int = 0
    @State var Correct: Int = 0
    @State var inCorrect: Int = 0
    
    @State var correctAnswers: [Int] = []
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Correct: \(Correct)")
                Text("inCorrect: \(inCorrect)")
            }
            .foregroundColor(.white)
            .font(.system(size: 30))
            .fontWeight(.bold)
            .padding(.top, 20)
            
            Spacer()
            HStack {
                Text("\(firstNumber) ")
                Label("", systemImage: "multiply")
                Text("\(secondNumber)")
            } //HStack
            .font(.system(size: 60))
            .fontWeight(.bold)
            .foregroundColor(.mint)
            .padding()
            
            VStack {
                if correctAnswers.count == 3 {
                    ForEach(0..<3) { index in
                        Button(action: {
                            checkAnswer(answer: correctAnswers[index])
                        }, label: {
                            Text("\(correctAnswers[index])")
                        })
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 200)
                        .background(Color.gray)
                        .cornerRadius(40)
                        .foregroundColor(.blue)
                        .padding(20)
                        .fontWeight(.bold)
                    } //VStack
                    .font(.system(size: 50))
                }
            }
            Spacer()
            Button("Reset") {
                Correct = 0
                inCorrect = 0
                random()
            }
        }//VStack
        .onAppear {
            random()
        }
        .background(Color.black)
    }
    
    func random() {
        firstNumber = Int.random(in: 2...9)
        secondNumber = Int.random(in: 1...9)
        result = firstNumber * secondNumber
        correctAnswers = [
            result,
            Int.random(in: 0...81),
            Int.random(in: 0...81)
        ]
        correctAnswers.shuffle()
    }
    
    func checkAnswer(answer: Int) {
        if answer == result {
            Correct += 1
        } else {
            inCorrect += 1
        }
        random()
    }
    
}

#Preview {
    ContentView()
}
