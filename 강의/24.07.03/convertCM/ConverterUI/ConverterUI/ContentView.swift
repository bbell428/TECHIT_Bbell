//
//  ContentView.swift
//  ConverterUI
//
//  Created by 김종혁 on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputCm: String = ""
    @State var outPutCm: String = ""
    
    var body: some View {
        VStack {
            Text("숫자를 입력하세요")
            HStack {
                TextField("", text: $inputCm)
                    .frame(width: 150)
                    .multilineTextAlignment(.trailing)
                Text("CM")
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            }.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            HStack {
                Button(action: {
                    convertCM(convert: { cmNumber in
                        return Double(cmNumber) * 10.0
                    })
                }, label: {
                    Text("mm")
                })
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
                
                Button(action: {
                    convertCM(){Num in
                        return Double(Num) / 100.0
                    }
                }, label: {
                    Text("m")
                })
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
                
                Button(action: {
                    let convertNum = { (cmNumber: Int) in
                        return Double(cmNumber) / 1000.0
                    }
                        convertCM(convert: convertNum)
                }, label: {
                    Text("km")
                })
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
            }
            Text("\(outPutCm)")
        }
        .font(.system(size: 30))
        .padding()
    }
    
    func convertCM(convert: (Int) -> Double) {
        let cmNumber: Int = Int(inputCm) ?? 0
        
        let conbertNumber: Double = convert(cmNumber)
        outPutCm = String(conbertNumber)
    }
}

#Preview {
    ContentView()
}
