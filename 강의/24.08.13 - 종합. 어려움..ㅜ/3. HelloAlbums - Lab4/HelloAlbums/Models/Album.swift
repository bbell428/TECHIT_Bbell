//
//  Albums.swift
//  HelloAlbums
//
//  Created by 김종혁 on 8/13/24.
//

import Foundation

enum Publisher: String, CaseIterable {
    case KJH = "김종혁"
    case BMS = "배문성"
}

struct Album {
    var publisher: Publisher
    var name: String
    var posterURL: String?
    var infoURL: String?
}
