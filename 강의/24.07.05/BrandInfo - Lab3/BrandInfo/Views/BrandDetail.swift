//
//  ContentView.swift
//  BrandInfo
//
//  Created by 김종혁 on 7/5/24.
//

import SwiftUI

struct BrandDetail: View {
    
    var brand: Brand
    
    var body: some View {
        let titleImageUrl: URL? = URL(string: brand.logoUrl)
        
        Text("\(brand.name)")
        Text("\(brand.country)")
        
        AsyncImage(url: titleImageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
        
        Text("\(brand.startYear)")
        Text("\(brand.nowOnSale)")
        
    }
}

#Preview {
        BrandDetail(brand: nikeData)
}
