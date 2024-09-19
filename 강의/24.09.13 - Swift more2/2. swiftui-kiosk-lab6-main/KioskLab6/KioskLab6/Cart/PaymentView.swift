//
//  payment퍋ㅈ.swift
//  KioskLab6
//
//  Created by 김동경 on 2024/09/13.
//

import SwiftUI

enum PayMent: String {
    case 신용카드
    case 카카오페이
    case 현금
    case 쿠폰
}

enum Package: String {
    case 매장
    case 포장
}
struct PaymentView: View {
    
    @EnvironmentObject private var cartStore: CartStore
    
    @State private var selectedPackage: Package = .매장
    @State private var selectePayment: PayMent = .신용카드
    @State private var isPayment: Bool = false
    
    var body: some View {
        ScrollView{
            Text("결제 수단을 선택해 주세요.")
                .font(.largeTitle)
                .padding(.horizontal, 24)
                .padding(.vertical, 22)
            
            HStack {
                Spacer()
                PaymentButton(PayMent.신용카드.rawValue, color: .blue, selected: selectePayment.rawValue == "신용카드") {
                    selectePayment = .신용카드
                }
                Spacer()
                PaymentButton(PayMent.카카오페이.rawValue, color: .yellow, selected: selectePayment.rawValue == "카카오페이") {
                    selectePayment = .카카오페이
                }
                Spacer()
            }
            .padding()
            
            HStack {
                Spacer()
                PaymentButton(PayMent.현금.rawValue, color: .indigo, selected: selectePayment.rawValue == "현금") {
                    selectePayment = .현금
                }
                Spacer()
                
                PaymentButton(PayMent.쿠폰.rawValue, color: .cyan, selected: selectePayment.rawValue == "쿠폰") {
                    selectePayment = .쿠폰
                }
                Spacer()
            }
            .padding()
            
            
            Button {
                isPayment.toggle()
            } label: {
                Text("결제하기")
                    .foregroundStyle(.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(.blue)
                    .font(.largeTitle)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .navigationDestination(isPresented: $isPayment){
               KioskHomeView()
                    .navigationBarBackButtonHidden(true)
            }
            Spacer()
            
        }
        .padding()
        .navigationTitle("결제하기 \(cartStore.totalPrice)원")
    }
}



struct PaymentButton: View {
    let text: String
    let color: Color
    let selected: Bool
    let action: () -> Void
    
    init(_ text: String, color: Color, selected: Bool, action: @escaping () -> Void) {
        self.text = text
        self.color = color
        self.selected = selected
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .modifier(PayButtonModifier(color: color, selected: selected))
            
        }
    }
}
#Preview {
    NavigationStack {
        PaymentView()
            .environmentObject(CartStore())
    }
}
