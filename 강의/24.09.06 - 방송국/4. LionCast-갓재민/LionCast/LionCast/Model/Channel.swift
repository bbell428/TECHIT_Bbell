//
//  Channel.swift
//  LionCast
//
//  Created by Jongwook Park on 9/6/24.
//

import Foundation

enum ChannelKind {
    case tv
    case radio
}

struct Channel: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var siteURL: String
    var kind: ChannelKind

    var programName: String = ""
    var nextProgramName: String = ""
    var videoURL: String = ""
    var imageURL: String = ""
    var title: String = ""
}
