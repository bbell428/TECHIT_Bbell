/*
 영화
 제목, 설명글, "시간", 공개일, 장르(들), 관람등급, 감독, 출연자(들)
 
 시리즈(드라마)
 제목, 설명글, 공개일, 장르(들), 관람등급, 출연자(들)
 : 에피소드 : 시즌, 화, 제목?, 설명, 시간
 
 쇼(예능)
 제목, 설명글, 공개일, 장르(들), 관람등급, 출연자(들)
 : 에피소드 : 시즌, 화, 제목?, 설명, 시간
 */

enum Genre: String {
    case documentary = "다큐멘터리"
    case sport = "스포츠"
    case drama = "드라마"
    // ....
}

protocol Poster {
    // 포스터 이미지 주소
    var posterImageURLString: String { get set }
    var posterImageURL: URL? { get }
}

extension Poster {
    var posterImageURL: URL? {
        get {
            return URL(string: posterImageURLString)
        }
    }
}

protocol MediaContent: Poster {
    var title: String { get set } // 제목
    var description: String { get set } // 설명글
    var year: Int { get set } // 공개일
    var genre: [String] { get set } // 장르(들)
    var rate: Int { get set } // 관람등급
    var directors: [String] { get set } // 감독(들)
    var actors: [String] { get set } // 출연자(들)
}

// 영화
protocol MovieContent: MediaContent {
    var runningTime: Int { get set } // 재생시간
}

//  시리즈(드라마)
protocol SeriesContent: MediaContent {
    var episodes: [Episode] { get set } // 에피소드(들)
}


// 에피소드
protocol EpisodeContent: Poster {
    var season: Int { get set } // 시즌
    var number: Int { get set } // 화
    var title: String { get set } // 제목
    var description: String { get set } // 설명
    var runningTime: Int { get set } // 재생시간
}

struct Movie: MovieContent {
    var title: String
    var description: String
    var year: Int
    var genre: [String]
    var rate: Int
    var directors: [String]
    var actors: [String]
    
    var posterImageURLString: String

    var runningTime: Int
}

struct Episode: EpisodeContent {
    var season: Int
    var number: Int
    var title: String
    var description: String
    var runningTime: Int
    
    var posterImageURLString: String
}

struct Series: SeriesContent {
    var title: String
    var description: String
    var year: Int
    var genre: [String]
    var rate: Int
    var directors: [String]
    var actors: [String]
    
    var posterImageURLString: String
    
    var episodes: [Episode] // has-a 관계
}

// 쇼(예능)을 위해서
// 같은 내용, 다른 타입 이름을 선언하는
// typealias를 사용해봅시다
typealias Show = Series
