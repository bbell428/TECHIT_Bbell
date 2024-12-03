//
//  ProductListView.swift
//  AppleShop
//
//  Created by Jongwook Park on 10/28/24.
//

import SwiftUI

struct ProductListView: View {
    var productStore: ProductStore
    
    var body: some View {
        List(productStore.products) { product in
            NavigationLink {
                ProductDetailView(product: product)
            } label: {
                VStack(alignment: .center) {
                    AsyncImage(url: product.imageURL) { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding()
                    .background(Color.white)
                    
                    Text("\(product.name)")
                        .font(.title)
                    Text("\(product.priceString)~")
                        .font(.headline)
                        .foregroundStyle(Color.accentColor)
                    
                }
            }
        }
        .navigationTitle("\(productStore.kind.rawValue)")
    }
}

#Preview {
    NavigationStack {
        ProductListView(productStore: .init(kind: .ipad))
    }
}
