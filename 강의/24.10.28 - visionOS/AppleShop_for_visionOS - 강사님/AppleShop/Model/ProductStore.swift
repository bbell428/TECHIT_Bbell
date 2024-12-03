//
//  ProductStore.swift
//  AppleShop
//
//  Created by Jongwook Park on 10/28/24.
//
import Foundation
import Observation

enum ProductKind: String {
    case mac = "Mac"
    case ipad = "iPad"
    case iphone = "iPhone"
    case watch = "Watch"
    case entertainment = "Entertainment"
}

@Observable
class ProductStore {
    var products: [Product] = []
    var kind: ProductKind = .mac
        
    init(kind: ProductKind) {
        self.kind = kind
        
        switch kind {
        case .mac:
            products = [
                Product(name: "MacBook Air",
                        price: 1390000,
                        imageURLString: "https://www.apple.com/v/macbook-air/s/images/specs/13-inch/mba_13_hero__cgrv1gqx437m_large_2x.jpg",
                        shopURLString: "https://www.apple.com/kr/shop/buy-mac/macbook-air/13-m2",
                        usdzName: "macbook_air_15_midnight"),
                Product(name: "MacBook Pro",
                        price: 2390000,
                        imageURLString: "https://www.apple.com/v/macbook-pro/ak/images/specs/14-inch/macbook_pro_14_inch__fy5v3x1ygaqi_large_2x.jpg",
                        shopURLString: "https://www.apple.com/kr/shop/buy-mac/macbook-pro",
                        usdzName: "macbook_pro_m3_pro_16_space_black"),
                Product(name: "iMac",
                        price: 1990000,
                        imageURLString: "https://www.apple.com/v/imac/p/images/specs/hero__b8jxtc10exiq_large_2x.jpg",
                        shopURLString: "https://www.apple.com/kr/shop/buy-mac/imac",
                        usdzName: "imac_4port_blue"),
                Product(name: "Mac mini",
                        price: 850000,
                        imageURLString: "https://www.apple.com/v/mac-mini/s/images/specs/hero_silver__fe3mpev33nau_large_2x.jpg",
                        shopURLString: "https://www.apple.com/kr/shop/buy-mac/mac-mini",
                        usdzName: "mac_mini_m2_pro_chip_silver_ios15"),
                Product(name: "Mac Studio",
                        price: 2990000,
                        imageURLString: "https://www.apple.com/v/mac-studio/f/images/specs/hero__d0yd117u6qy6_large_2x.jpg",
                        shopURLString: "https://www.apple.com/kr/shop/buy-mac/mac-studio",
                        usdzName: "mac_studio"),
                Product(name: "Mac Pro",
                        price: 10490000,
                        imageURLString: "https://www.apple.com/v/mac-pro/o/images/specs/finish_rack__5mrpl1if1w2a_large_2x.jpg",
                        shopURLString: "https://www.apple.com/kr/shop/buy-mac/mac-pro",
                        usdzName: "mac_pro_ios16"),
                Product(name: "Studio Display",
                        price: 2090000,
                        imageURLString: "https://www.apple.com/v/studio-display/c/images/specs/hero__fjwz2k1uofue_large_2x.jpg",
                        shopURLString: "https://www.apple.com/kr/shop/buy-mac/apple-studio-display",
                        usdzName: "studio_display"),
                Product(name: "Pro Display XDR",
                        price: 6499000,
                        imageURLString: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/pro-display-hero?wid=820&hei=474&fmt=jpeg&qlt=90&.v=1572384750703",
                        shopURLString: "https://www.apple.com/kr/shop/buy-mac/pro-display-xdr",
                        usdzName: "display"),
            ]
            
        case .ipad:
            products = [
                Product(name: "iPad Pro",
                        price: 1249000,
                        imageURLString: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-pro-storage-select-202212-12-9inch-silver?wid=5120&hei=2880&fmt=p-jpg&qlt=95&.v=1667595233633",
                        shopURLString: "https://www.apple.com/kr/shop/buy-ipad/ipad-pro",
                        usdzName: "ipad_pro_12_9in_silver_6gen_magic_keyboard_white_wifi_ios15"),
                Product(name: "iPad Air",
                        price: 929000,
                        imageURLString: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-air-finish-select-gallery-202211-purple-wifi?wid=5120&hei=2880&fmt=p-jpg&qlt=95&.v=1670631590784",
                        shopURLString: "https://www.apple.com/kr/shop/buy-ipad/ipad-air",
                        usdzName: "ipad_air_purple_wifi"),
                Product(name: "iPad",
                        price: 679000,
                        imageURLString: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-10th-gen-finish-select-202212-blue?wid=5120&hei=2880&fmt=p-jpg&qlt=95&.v=1670623404758",
                        shopURLString: "https://www.apple.com/kr/shop/buy-ipad/ipad",
                        usdzName: "ipad_10gen_hero"),
                Product(name: "iPad mini",
                        price: 769000,
                        imageURLString: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-mini-finish-select-gallery-202211-starlight-wifi?wid=5120&hei=2880&fmt=p-jpg&qlt=95&.v=1670950636765",
                        shopURLString: "https://www.apple.com/kr/shop/buy-ipad/ipad-mini/",
                        usdzName: "ipad_mini_ios15_purple_wifi"),
            ]
            
        case .iphone:
            products = [
                Product(name: "iPhone 15 Pro",
                        price: 1550000,
                        imageURLString: "https://www.apple.com/v/iphone-15-pro/c/images/specs/hero_iphone_pro__c9kj8iil656q_large_2x.jpg",
                        shopURLString: "https://www.apple.com/kr/shop/buy-iphone/iphone-15-pro",
                        usdzName: "iphone_15_pro_blue_titanium_no5g"),
                Product(name: "iPhone 15",
                        price: 1250000,
                        imageURLString: "https://www.apple.com/v/iphone-15/c/images/specs/finish_iphone_plus__eeg40kwwxe4i_large_2x.jpg",
                        shopURLString: "https://www.apple.com/kr/shop/buy-iphone/iphone-15",
                        usdzName: "iphone_15_plus_iphone_15_pink_no5g"),
                Product(name: "iPhone SE",
                        price: 650000,
                        imageURLString: "https://www.apple.com/v/iphone-se/k/images/specs/hero__cglpk2kq67le_large_2x.jpg",
                        shopURLString: "https://www.apple.com/kr/shop/buy-iphone/iphone-se",
                        usdzName: "iphone_se_3rdgen_midnight"),
            ]
            
        case .watch:
            products = [
                Product(name: "Apple Watch Series 9",
                        price: 599000,
                        imageURLString: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/s9-case-unselect-gallery-1-202403_GEO_KR?wid=5120&hei=3280&fmt=p-jpg&qlt=80&.v=1708729830940",
                        shopURLString: "https://www.apple.com/kr/shop/buy-watch/apple-watch",
                        usdzName: "watch_S9_gps"),
                Product(name: "Apple Watch Ultra 2",
                        price: 1149000,
                        imageURLString: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ultra-band-unselect-gallery-1-202309_GEO_KR?wid=5120&hei=3280&fmt=p-jpg&qlt=80&.v=1693544605805",
                        shopURLString: "https://www.apple.com/kr/shop/buy-watch/apple-watch-ultra",
                        usdzName: "watch_ultra_trail_loop_orange_beige"),
                Product(name: "Apple Watch SE",
                        price: 329000,
                        imageURLString: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/se-case-unselect-gallery-1-202403?wid=5120&hei=3280&fmt=p-jpg&qlt=80&.v=1707846664521",
                        shopURLString: "https://www.apple.com/kr/shop/buy-watch/apple-watch-se",
                        usdzName: "watch_SE_gps"),
            ]
            
        case .entertainment:
            products = [
                Product(name: "AirPods 3세대",
                        price: 259000,
                        imageURLString: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MME73?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1632861342000",
                        shopURLString: "https://www.apple.com/kr/shop/product/MME73KH/A/airpods3세대-magsafe-충전-케이스-모델",
                        usdzName: "airpods_magsafe_charging_ios15"),
                Product(name: "AirPods Pro 2세대",
                        price: 359000,
                        imageURLString: "https://www.apple.com/v/airpods-pro/h/images/specs/airpods__ea3kvnhxv96q_large_2x.jpg",
                        shopURLString: "https://www.apple.com/kr/shop/product/MTJV3KH/A/airpods-pro",
                        usdzName: "airpods_pro_with_magsafe_charging_case_ios15"),
                Product(name: "Apple TV 4K",
                        price: 219000,
                        imageURLString: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/apple-tv-4k-hero-select-202210?wid=1076&hei=1070&fmt=jpeg&qlt=90&.v=1664896361408",
                        shopURLString: "https://www.apple.com/kr/shop/buy-tv/apple-tv-4k",
                        usdzName: "apple_tv_4k_3rdgen_wifi_ethernet_siri_remote_3rdgen"),
            ]
        }
    }
}
