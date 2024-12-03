//
//  ProductDetailView.swift
//  AppleShop
//
//  Created by Jongwook Park on 10/28/24.
//

import SwiftUI
import RealityKit

struct ProductDetailView: View {
    var product: Product
    var body: some View {
        VStack {
            RealityView { content in
                if let usdz = try? await ModelEntity(named: "\(product.usdzName).usdz") {
                    content.add(usdz)
                }
            }
        }
        .ornament(visibility: .automatic, attachmentAnchor: .scene(.bottom), contentAlignment: .center, ornament: {
            HStack(spacing: 10) {
                Link(destination: product.shopURL) {
                    Label("Buy \(product.priceString)~", systemImage: "cart")
                }
                .buttonStyle(.plain)
                .padding(25)
            }
            .background(.blue.tertiary)
            .glassBackgroundEffect()
        })
        .navigationTitle(product.name)
    }
}

#Preview {
    NavigationStack {
        ProductDetailView(product: .sample)
    }
}
