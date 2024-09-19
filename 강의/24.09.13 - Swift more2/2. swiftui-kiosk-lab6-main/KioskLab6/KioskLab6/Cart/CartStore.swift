//
//  CartStore.swift
//  KioskLab6
//
//  Created by 김동경 on 2024/09/13.
//

import SwiftUI

struct CartItem: Identifiable {
    let id = UUID()
    let food: Food
    var count: Int
}



class CartStore: ObservableObject {
    
    @Published var cartItems: [CartItem] = []
    @Published var isAlertVisible: Bool = false
    var totalPrice: Int {
        cartItems.reduce(0) { $0 + ($1.food.price) * ($1.count) }
    }
    
    var totalItemCount: Int {
        cartItems.reduce(0) { $0 + $1.count }
    }
    
    func addCartItem(_ item: Food) {
        if let index = cartItems.firstIndex(where: { $0.food.id == item.id }) {
            cartItems[index].count += 1
        } else {
            cartItems.append(CartItem(food: item, count: 1))
        }
    }
    
    func removeItem(_ item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems.remove(at: index)
        }
    }
    
    func addCountCartItem(_ item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            var new = cartItems[index]
            new.count += 1
            cartItems[index] = new
        }
    }
    
    func minusCountCartItem(_ item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            var new = cartItems[index]
            new.count -= 1
            cartItems[index] = new
        }
    }
    
}
