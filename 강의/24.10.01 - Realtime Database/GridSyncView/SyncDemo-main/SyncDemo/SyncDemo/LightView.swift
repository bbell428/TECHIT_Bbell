//
//  LightView.swift
//  SyncDemo
//
//  Created by Jongwook Park on 3/5/24.
//

import SwiftUI
import FirebaseDatabase

struct LightView: View {
    @State private var lightOn: Bool = true
    
    private var lightColor: Color {
        return if lightOn {
            Color.green
        } else {
            Color.gray
        }
    }
    
    var body: some View {
        VStack {
            Image(systemName: "lightbulb")
                .font(.system(size: 250))
                .foregroundStyle(lightColor)
            
            Button("Toggle Light") {
                toggleLight()
            }
            .font(.largeTitle)
            .padding()
        }
        .onAppear {
            observeLightState()
        }
    }
    
    private func toggleLight() {
        lightOn.toggle()
        
        // Firebase의 Realtime DB에 반영한다
        Database.database().reference().child("lightOn").setValue(lightOn)
    }
    
    private func observeLightState() {
        // Firebase의 Realtime DB 내용을 화면에 반영한다
        // observe를 통해 이 화면이 존재하는 동안
        // 계속 실시간 반영을 일으킨다
        Database.database().reference().child("lightOn").observe(.value) { snapshot in
            
            print("\(snapshot)")
            
            // 0과 1로 넘어오는 값을 Bool 타입으로 강제 변환 성공하면 반영한다
            if let value = snapshot.value as? Bool {
                lightOn = value
            }
        }
    }
    
}

#Preview {
    LightView()
}
