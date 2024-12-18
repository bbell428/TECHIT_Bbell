//
//  TayoCharacter.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import SwiftUI

enum BusKind: String {
    case trunk = "간선(blue)"
    case branch = "지선(green)"
    case circulation = "순환(yellow)"
    case rapid = "광역(red)"
}

class TayoCharacter: AnimationCharacter {
    var busKind: BusKind
    var number: Int
    
    init(name: String, color: Color, busKind: BusKind, number: Int) {
        self.busKind = busKind
        self.number = number
        
        super.init(name: name, color: color)
    }
}
