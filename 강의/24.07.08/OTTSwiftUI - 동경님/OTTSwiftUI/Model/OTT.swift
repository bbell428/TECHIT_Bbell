//
//  OTT.swift
//  OTTSwiftUI
//
//  Created by 김동경 on 2024/07/08.
//

import Foundation

protocol OttType {
    var type: VideoType { get set }
}

enum VideoType: String {
    case 영화
    case 드라마
    case 애니메이션
    case 다큐
}

struct OTT: OttType, Identifiable {
    var id: UUID = UUID()
    var type: VideoType
    var contents: [Content]
}

extension OTT {
    static func getData() -> [OTT] {
        return [OTT(type: .영화, contents: [Content(title: "아저씨", description: "아직 한 발 남았다..,"),
                                          Content(title: "아이언맨", description: "I am a Iron man")]),
                
                OTT(type: .드라마, contents: [Content(title: "스카이 캐슬", description: "전적으로 저를 믿으셔야 합니다"),
                                           Content(title: "이태원 클라쓰", description: "나는~~ 돌덩이")]),
                
                
                OTT(type: .애니메이션, contents: [Content(title: "주술회전", description: "료이키 텐카이!!"),
                                             Content(title: "원피스", description: "나니모 나카타...")]),
                
                OTT(type: .다큐, contents: [Content(title: "극한직업", description: "개발자..."),
                                          Content(title: "마이클 조던: 라스트댄스", description: "GOAT")])]
    }
}

struct Content: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String
}
