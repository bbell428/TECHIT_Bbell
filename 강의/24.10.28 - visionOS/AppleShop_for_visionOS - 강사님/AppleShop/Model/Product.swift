//
//  Product.swift
//  AppleShop
//
//  Created by Jongwook Park on 10/28/24.
//

import Foundation

struct Product: Identifiable {
    var id: UUID = .init()
    
    var name: String
    var price: Double
    var imageURLString: String
    var shopURLString: String
    var usdzName: String
    
    var priceString: String {
        price.currencyString
    }
    
    var imageURL: URL {
        URL(string: imageURLString) ?? URL(string: "https://apple.com")!
    }
    
    var shopURL: URL {
        URL(string: shopURLString) ?? URL(string: "https://apple.com")!
    }
    
    static var sample: Product {
        Product(name: "MacBook Air",
                price: 1390000,
                imageURLString: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mba13-midnight-select-202402?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1708367688034",
                shopURLString: "https://www.apple.com/kr/shop/buy-mac/macbook-air/13-m2",
                usdzName: "macbook_air_15_midnight")
    }
}
