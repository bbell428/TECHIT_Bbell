//
//  KioskButton.swift
//  KioskLab6
//
//  Created by Soom on 9/13/24.
//

import SwiftUI

struct KioskButton<Content:View>: View{
    let name: String
    let destination: Content
    
    init(name: String,@ViewBuilder destination: () -> Content) {
        self.name = name
        self.destination = destination()
    }
    
    var body: some View {
        NavigationLink{
            destination
        }label: {
            Text(name)
                .frame(maxWidth: .infinity)
                .frame(height: 500)
                .font(.system(size: 65))
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.green.gradient)
                )
        }
    }
}

//#Preview {
////    KioskButton<<#Content: View#>>(name: "먹고가기")
//}
