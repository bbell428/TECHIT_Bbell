//
//  TayoCharatersData.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import Foundation

let tayoCharaters: [TayoCharacter] = [
    TayoCharacter(name: "타요", color: .blue, imageUrlString: "https://i.namu.wiki/i/qz9NeA8pbYKkM4QkN-V--geebxCu6DCvEfVRLvC9DccaIeu0J2IOPsQxuPXPCqFsVUzR5i-1IryjQepjzEsK7pbolImEQr495YVLkMVV4XsBKVvuw1aLG6VxemW49grdBst_Qir8COFm66Jm_OdrEg.webp", busKind: .trunk, number: "120"),
    TayoCharacter(name: "로기", color: .green, imageUrlString: "", busKind: .branch, number: "1000"),
    TayoCharacter(name: "라니", color: .yellow, imageUrlString: "", busKind: .circulation, number: "02"),
    TayoCharacter(name: "가니", color: .red, imageUrlString: "", busKind: .rapid, number: "1339"),
]

let sampleTayoCharater: TayoCharacter = tayoCharaters.first!
