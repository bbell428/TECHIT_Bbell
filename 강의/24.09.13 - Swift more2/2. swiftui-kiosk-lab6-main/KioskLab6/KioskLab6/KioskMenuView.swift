//
//  KioskMenuView.swift
//  KioskLab6
//
//  Created by Soom on 9/13/24.
//

import SwiftUI

struct KioskMenuView: View {
    let gridItem = [GridItem(.fixed(320)),GridItem(.fixed(320)),GridItem(.fixed(320))]
    
    @Binding var category: CountryFood
    @EnvironmentObject var cartStore: CartStore
    var body: some View {
        HStack{
            ScrollView{
                LazyVGrid(columns: gridItem){
                    ForEach(foodCountry,id:\.id){ food in
                        if category == food.category{
                            Button{
                                cartStore.addCartItem(food)
                            }label:{
                                foodItemView(food: food)
                            }
                        }else if category.rawValue == "전체" {
                            Button{
                                cartStore.addCartItem(food)
                                
                            }label:{
                                foodItemView(food: food)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
                }
            }
        }
    }
    @ViewBuilder
    func foodItemView(food: Food)-> some View{
        VStack{
            food.image
                .resizable()
                .cornerRadius(8)
            Text(food.foodName)
            Text("\(food.price)")
        }
    }
}

#Preview {
    KioskMenuView(category: .constant(.china))
}
