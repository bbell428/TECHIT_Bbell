//
//  CounterView.swift
//  ZeroCount
//
//  Created by Jongwook Park on 2/5/24.
//

/*
 
 Write once, run everywhere -> Java
 
 Learn once, use everywhere -> SwiftUI
 
 */

import SwiftUI

struct ContentView: View {
    @AppStorage("ZeroCountValue") private var count: Int = 0
    
    @State private var showAlertReset: Bool = false
    @State private var showAlertSave: Bool = false
    
    private let fontSize: CGFloat = 100
    
    // MARK: -  0이 되면 Zero가 나오게 만들 연산프로퍼티 추가
    var countString: String {
        count > 0 ? "\(count)" : "ZERO"
    }
    
    var body: some View {
        VStack {
            
            Button(action: {
                count += 1
                
            }, label: {
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        
                        Text("\(countString)")
                            .font(.system(size: fontSize))
                            .fontWeight(.heavy)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        
                        Spacer()
                    }
                    Spacer()
                }
            })
            .background(Color.accentColor)
            
            VStack {
                HStack {
                    Button(action: {
                        if count > 0 {
                            count -= 1
                        }
                    }, label: {
                        Image(systemName: "minus.circle.fill")
                    })
                    Button(action: {
                        showAlertReset.toggle()
                    }, label: {
                        Image(systemName: "arrow.clockwise.circle.fill")
                    })
                }
            }
        }
        .alert(String(localized: "Will you reset?"), isPresented: $showAlertReset) {
            Button(role: .destructive) {
                count = 0
            } label: {
                Text(String(localized: "Reset"))
            }
        }
        .alert(String(localized: "Saving is completed"), isPresented: $showAlertSave, actions: { }, message: {
            Text(String(localized: "into history tab"))
        })
    }
}

#Preview {
    ContentView()
}
