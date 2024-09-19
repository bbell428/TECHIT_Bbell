//
//  CartView.swift
//  KioskLab6
//
//  Created by 김동경 on 2024/09/13.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartStore: CartStore
    
    var body: some View {
        HStack {
            Text("총 주문내역")
                .font(.largeTitle)
            
            
            Spacer()
            
            Text("총 \(cartStore.totalItemCount)개")
                .font(.largeTitle)
            
            Spacer()
            
            Text("\(cartStore.totalPrice)원")
                .font(.largeTitle)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 22)
        .background(Color(.systemGray6))
        
        ScrollView {
            LazyVStack {
                ForEach(cartStore.cartItems, id:\.id) { item in
                    CartItemCell(cartStore: cartStore, cartItem: item)
                }
            }
        }
        
        HStack {
            Spacer()
            
            LabelButton {
               //홈으로
            } label: {
                Image(systemName: "house")
            }
           
            Spacer()
            
            Button {
                
            } label: {
              Text("취소하기")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .frame(width:300, height: 100)
                    .background(.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    
            }
            .padding()
            
            
            NavigationLink {
               PaymentView()
                    .environmentObject(cartStore)
            } label: {
              Text("결제하기")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .frame(width:300, height: 100)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    
            }
            .padding()
            
            Spacer()
        }
        
        
    }
}

#Preview {
    //프리뷰야 힘을내
    NavigationStack {
        CartView()
            .environmentObject(CartStore())
    }
}
