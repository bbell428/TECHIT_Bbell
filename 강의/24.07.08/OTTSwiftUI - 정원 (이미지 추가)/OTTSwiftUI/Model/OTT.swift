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
    var imageUrlString: String
    
    var imageUrl: URL? {
        get {
            return URL(string: imageUrlString)
        }
    }
}

extension Content {
    static func getMovies() -> [Content] {
        return [
            Content(title: "아저씨", description: "아직 한 발 남았다..", imageUrlString: "https://health.chosun.com/site/data/img_dir/2010/09/13/2010091301247_0.jpg"),
            Content(title: "아이언맨", description: "I am a Iron man", imageUrlString: "https://cdn.casenews.co.kr/news/photo/201905/2398_9196_342.jpg")
        ]
    }
    static func getDramas() -> [Content] {
        return [
            Content(title: "스카이 캐슬", description: "전적으로 저를 믿으셔야 합니다", imageUrlString: "https://upload.wikimedia.org/wikipedia/ko/0/0a/%EC%8A%A4%EC%B9%B4%EC%9D%B4%EC%BA%90%EC%8A%AC_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg"),
            Content(title: "이태원 클라쓰", description: "나는~~ 돌덩이", imageUrlString: "https://i.namu.wiki/i/4c6aR0E32TLnWOD0kdhBsii9WF3XjHyWjKkeEmbVTRXMPrRbDNfFptd-FxOQ7d_fyQ6ahJwSQwOSlLwBFPI5ZQ.webp")
        ]
    }
    static func getAnimations() -> [Content] {
        return [
            Content(title: "주술회전", description: "료이키 텐카이!!", imageUrlString: "https://i.namu.wiki/i/9AVKwwbmdmlqudVcnvDmDdmAh76uzT8_tsHB5iqDujRhNBnxhf65niImM4dePb4u_m0AsmDSp_I5Y8VogIzUcA.webp"),
            Content(title: "원피스", description: "나니모 나카타...", imageUrlString: "https://i.namu.wiki/i/r52RyMBi9Fmclux64jb7AlQl6XgVIn2yz1_FJFfEyg-gqxyXYaLZjXCYlKvtvnHjt1Q0hAE6JQ6kGH05EE8Zwg.webp")
        ]
    }
    static func getDocumentaries() -> [Content] {
        return [
            Content(title: "극한직업", description: "개발자...", imageUrlString: "https://i.namu.wiki/i/GOnIOoQKymiK379myKp75oFUXxKIcBkttILKMaKIqXjVAHgRZ-9Q2w0yW2Ba7g_3sT0P3s0ME-4z6JHuBYU-Gw.webp "),
            Content(title: "마이클 조던: 라스트댄스", description: "GOAT", imageUrlString: "https://i.namu.wiki/i/MLyQG832wBurhnLWd1o2PMjwghBm5wqe8eSJjMMqpc-DJ8u7NCaiPD63dL3sTB5hYDAH7QSNVLt3OMsViq79WQ.webp")
        ]
    }
}
