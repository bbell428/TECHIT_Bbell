//
//  StateView.swift
//  HelloDemo
//
//  Created by Jongwook Park on 9/6/24.
//

import SwiftUI

// StateObject와 ObservedObject의 차이

class LightMode: ObservableObject {
    @Published var isLightOn: Bool = false
}

struct StateView: View {
    @State private var isLightOn: Bool = false
    
    var body: some View {
        VStack(spacing: 50) {
            Text("superview")
            Text("\(isLightOn)")
                .font(.largeTitle)
            
            Button("Toggle") {
                isLightOn.toggle()
            }
            
            SubStateView()
            SubObservedView()
            
        }
    }
}

struct SubStateView: View {
    // 슈퍼뷰가 이곳의 Body를 새롭게 그리게 해도
    // StateObject는 그 상태를 그대로 유지한다
    @StateObject var lightMode = LightMode()

    var body: some View {
        VStack {
            Text("SubStateView")
            Text("\(lightMode.isLightOn)")
                .font(.largeTitle)
            
            Button("Toggle") {
                lightMode.isLightOn.toggle()
            }
        }
    }
}

struct SubObservedView: View {
    // 슈퍼뷰가 이곳의 Body를 새롭게 하면
    // ObservedObject는 그 상태를 새롭게 생성한다
    @ObservedObject var lightMode = LightMode()

    var body: some View {
        VStack {
            Text("SubObservedView")
            Text("\(lightMode.isLightOn)")
                .font(.largeTitle)
            
            Button("Toggle") {
                lightMode.isLightOn.toggle()
            }
        }
    }
}

#Preview {
    StateView()
}
