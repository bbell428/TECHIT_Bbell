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
    var imageUrlString: String
    
    var imageUrl: URL? {
        get {
            return URL(string: imageUrlString)
        }
    }
    
    init(name: String, color: Color, imageUrlString: String) {
        self.name = name
        self.color = color
        self.imageUrlString = imageUrlString
    }
}
