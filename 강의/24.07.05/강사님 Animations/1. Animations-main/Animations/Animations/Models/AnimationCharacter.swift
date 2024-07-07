//
//  AnimationCharacter.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import SwiftUI

class AnimationCharacter: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var color: Color
    
    init(name: String, color: Color) {
        self.name = name
        self.color = color
    }
}
