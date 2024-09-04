//
//  ContentView.swift
//  SwiftDemo
//
//  Created by 김종혁 on 9/3/24.
//

import SwiftUI

struct ContentView: View {
    
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "어서오세요"
    
    var body: some View {
        VStack {
            Spacer()
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 1.5), value: rotation)
                .foregroundStyle(colors[colorIndex])
                .lineLimit(1...3)
                .shadow(radius: 3, x: 13, y: 10)
            Spacer()
            Divider()
            
            Slider(value: $rotation, in: 0 ... 360, step: 0.1)
                .padding()
            
            TextField("입력하세요", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach(0 ..< colornames.count, id:\.self) {
                    Text(colornames[$0])
                        .foregroundStyle(colors[$0])
                }
            }
            .pickerStyle(.wheel)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
