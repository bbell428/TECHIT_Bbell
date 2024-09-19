//
//  KioskHomeView.swift
//  KioskLab6
//
//  Created by Soom on 9/13/24.
//

import SwiftUI


struct KioskHomeView: View {
    let backgroundColor = LinearGradient(colors: [.indigo, .mint] , startPoint: .top, endPoint: .bottom)
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Text("주문하기")
                    .font(.system(size: 85))
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                Spacer()
                HStack{
                    KioskButton(name: "먹고가기"){
                        KioskCategoryButton()
                    }
                    KioskButton(name: "포장하기"){
                        KioskCategoryButton()
                    }
                }
                .padding(.horizontal,10)
            }
            .background(backgroundColor)
        }
    }
}

#Preview {
    KioskHomeView()
}
