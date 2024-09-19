//
//  CartItemCell.swift
//  KioskLab6
//
//  Created by 김동경 on 2024/09/13.
//

import SwiftUI

struct CartItemCell: View {
    
    @ObservedObject private var cartStore: CartStore
    let cartItem: CartItem
    
    var categoryColor: Color {
        switch cartItem.food.category {
        case .korea:
                .blue
        case .china:
                .orange
        case .japan:
                .red
        case .drink:
                .indigo
        case .all:
                .brown
        }
    }
    init(cartStore: CartStore, cartItem: CartItem) {
        self.cartStore = cartStore
        self.cartItem = cartItem
    }
    
    var body: some View {
       
            HStack {
                Spacer()
                
                Text("\(cartItem.food.category.rawValue)")
                               .modifier(CategoryModifier())
                               .font(.largeTitle)
                               .foregroundStyle(categoryColor)
                               .frame(width: 100) // 카테고리 텍스트의 고정된 너비
                
                Spacer()
                
                Text("\(cartItem.food.foodName)")
                               .font(.largeTitle)
                               .frame(width: 150, alignment: .leading)
                Spacer()
                
                Stepper {
                }
            onIncrement: {
                cartStore.addCountCartItem(cartItem)
            } onDecrement: {
                if cartItem.count > 1 {
                    cartStore.minusCountCartItem(cartItem)
                }
            }
            .labelsHidden()
            .padding(5)
                
                Spacer()
                
                Text("\(cartItem.count)개")
                    .font(.largeTitle)
                
                Spacer()
                
                Button {
                    cartStore.isAlertVisible.toggle()
                } label: {
                    Image(systemName: "xmark")
                }
                .sheet(isPresented: $cartStore.isAlertVisible) {
                    VStack {
                        Text("\(cartItem.food.foodName)을 삭제 할가요?")
                            .font(.largeTitle)
                        Spacer().frame(height: 20)
                        HStack {
                            Button("삭제", role: .destructive) {
                                cartStore.removeItem(cartItem)
                                cartStore.isAlertVisible = false
                            }
                            .padding()
                            
                            Spacer().frame(width: 30)
                            
                            Button {
                                cartStore.isAlertVisible.toggle()
                            } label: {
                                Text("취소")
                            }
                            .padding()
                        }
                    }
                    .cornerRadius(18)
                    .padding()
                }
                .font(.largeTitle)
                
                Spacer()
            }
            .padding()
        }
    
}

#Preview {
    CartItemCell(cartStore: .init(), cartItem: .init(food: .init(category: .china, foodName: "짜장", imageName: "", price: 2000), count: 2))
}
