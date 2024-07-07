//
//  CharacterImageView.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import SwiftUI

struct CharacterImageView: View {
    var character: AnimationCharacter
    
    var body: some View {
        AsyncImage(url: character.imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    CharacterImageView(character: samplePororoChracters)
}
