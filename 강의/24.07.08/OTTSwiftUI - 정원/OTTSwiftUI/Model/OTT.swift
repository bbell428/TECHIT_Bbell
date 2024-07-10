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
    
enum VideoType { // 앞으로 추가가 됐을때 영 var movie = [영화, 드라마, 애니메이션, 다큐]
    case 영화
    case 드라마
    case 애니메이션
    case 다큐
    
    var videoType: String {
        switch self {
        case .영화:
            return "영화"
        case .드라마:
            return "드라마"
        case .애니메이션:
            return "애니메이션"
        case .다큐:
            return "다큐"
        
        }
    }
}
struct OTT: OttType, Identifiable {
    var id: UUID = UUID()
    var type: VideoType // 타입 
    var contents: [Content] // 내용
}
// 예능과 스포츠
// 데이터는 아예 따로 빼놓는게 좋음
extension OTT {
    static func getData() -> [OTT] {
        [
            OTT(type: .영화, contents: Content.getMovies()),
            OTT(type: .드라마, contents: Content.getDramas()),
            OTT(type: .애니메이션, contents: Content.getAnimations()),
            OTT(type: .다큐, contents: Content.getDocumentaries()),
        ]
    }
}

struct Content: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String
}

extension Content {
    static func getMovies() -> [Content] {
        return [
            Content(title: "아저씨", description: "아직 한 발 남았다.."),
            Content(title: "아이언맨", description: "I am a Iron man")
        ]
    }
    static func getDramas() -> [Content] {
        return [
            Content(title: "스카이 캐슬", description: "전적으로 저를 믿으셔야 합니다"),
            Content(title: "이태원 클라쓰", description: "나는~~ 돌덩이")
        ]
    }
    static func getAnimations() -> [Content] {
        return [
            Content(title: "주술회전", description: "료이키 텐카이!!"),
            Content(title: "원피스", description: "나니모 나카타...")
        ]
    }
    static func getDocumentaries() -> [Content] {
        return [
            Content(title: "극한직업", description: "개발자..."),
            Content(title: "마이클 조던: 라스트댄스", description: "GOAT")
        ]
    }
}
