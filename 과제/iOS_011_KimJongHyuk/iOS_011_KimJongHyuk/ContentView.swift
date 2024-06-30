//
//  ContentView.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 6/27/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var number: Int = 0
    @State var count: String = "한자리 숫자"
    
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            VStack{
                Text("\(count)")
                    .padding()
                    .foregroundStyle(.mint)
                    .fontWeight(.bold)
                
                Text("\(number)")
                    .font(.largeTitle)
                    .foregroundStyle(.mint)
                    .fontWeight(.bold)
                    .shadow(color: .gray, radius: 1.5, x: 5, y: 5)
                
                HStack{
                    
                    Button(action: {
                        number += 1
                        numberCount(number)
                    }, label: {
                        Label("", systemImage: "plus.app")
                    })
                    .padding()
                    
                    Button(action: {
                        number -= 1
                        numberCount(number)
                    }, label: {
                        Label("", systemImage: "minus.square")
                    })
                    .padding()
                    
                } //HStack
                .font(.system(size: 50))
                
                Button("Square"){
                    squareNumber()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(20)
                .padding(.bottom, 30)
                
                Button("Reset"){
                    number = 0
                    numberCount(number)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(20)
                
            } //VStack
            .font(.system(size: 30))
            .padding()
        }
    }
    
    func numberCount(_ number: Int) {
        switch number {
        case 0 ... 9 :
            count = "한자리 숫자"
        case 10 ... 99 :
            count = "두자리 숫자"
        case 100...  :
            count = "큰 숫자"
        default:
            count = "마이너스 숫자"
        }
    }
    
    func squareNumber() {
        if (number > 0) && (number <= Int.max / number) {
            number *= number
            numberCount(number)
        } else if number < 0 {
            number *= number
            numberCount(number)
        }
        else if number == 0{
            count = "0 입니다."
        } else {
            count = "오버플로우 발생!"
        }
    }
    
}

#Preview {
    ContentView()
}
