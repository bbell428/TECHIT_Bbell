//
//  LightView.swift
//  SyncLight
//
//  Created by Jongwook Park on 10/4/24.
//

import SwiftUI
import Firebase

struct LightView: View {
    @State private var lightOn = false
    
    let databaseRef = Database.database().reference()
    
    var body: some View {
        VStack {
            if lightOn {
                Image(systemName: "lightbulb.max.fill")
                Text("ON")
            } else {
                Image(systemName: "lightbulb.slash")
                Text("OFF")
            }
            
            Divider()
            
            Button("Toggle Light") {
                lightOn.toggle()
                
                databaseRef.child("lightOn").setValue(lightOn)
            }
        }
        .font(.largeTitle)
        .padding()
        .onAppear {
            databaseRef.child("lightOn").observe(.value) { snapshot in
                
                if let value = snapshot.value as? Bool {
                    lightOn = value
                }
            }
        }
    }
}

#Preview {
    LightView()
}
