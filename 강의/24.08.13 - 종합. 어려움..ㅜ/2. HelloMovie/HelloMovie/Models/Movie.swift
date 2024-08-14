//
//  Movie.swift
//  HelloMovie
//
//  Created by Jongwook Park on 8/13/24.
//

import Foundation

enum Publisher {
    case cjEnm
    case nextEntWorld
    case showbox
    case lotte
    case plusM
}

struct Movie {
    var publisher: Publisher
    var name: String
    var year: Int
    var posterURL: String?
    var infoURL: String?
}
