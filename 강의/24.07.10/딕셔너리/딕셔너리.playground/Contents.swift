let names: [String] = ["Ned", "Tuna"]

// 위의 배열과 거의 흡사한 딕셔너리를 만들어봅시다
let dicNames: [Int:String] = [
    0: "Ned",
    1: "Tuna"
]

print("\(dicNames) \n")

// 딕셔너리의 key 타입들 : String, Int, Bool, Double
let dicTutors: [String:String] = [
    "Code": "Ned",
    "UX": "Tuna"
]

// 딕셔너리의 내용들은 순서없이 담기지만
// key와 value의 조합들을 하나씩 꺼내어
// 활용할 수 있다.
for (part, name) in dicTutors {
    print("\(part): \(name)")
}
print()


// 딕셔너리를 새롭게 만들어봅시다
// 나라마다 언어를 찾에 도와줍시다

// 대부분 학생들께서 만드는 딕셔너리는 이렇습니다.

let langs: [String:String] = [
    "한국": "한국어",
    "일본": "일본어",
    "미국": "영어",
    "영국": "영어",
    "중국": "중국어",
]

print(langs["한국"] ?? "(key를 못찾음)")
print()

// 자료 구조 처리를 위해 더 나은 구조는 이렇습니다
// 배열과 - 딕서너리 조합!!
let languages: [[String:String]] = [
    [
        "국가": "한국",
        "언어": "한국어"
    ],
    [
        "국가": "일본",
        "언어": "일본어"
    ],
    [
        "국가": "미국",
        "언어": "영어"
    ],
    [
        "국가": "영국",
        "언어": "영어"
    ],
    [
        "국가": "중국",
        "언어": "중국어"
    ]
]

if let country = languages.last {
    print(country["언어"] ?? "(항목 찾기 실패)")
}
print()

for language in languages {
    if let country = language["국가"], country == "영국" {
        print("\(country)의 언어는 \(language["언어"] ?? "(찾지못함)")입니다")
        // 영국의 언어는 영어입니다
    }
}
print()

// 하지만 딕셔너리에서 계속 항목이 늘어난다면 구조체로 가는 게 좋다
struct Country {
    var name: String
    var language: String
    var flag: String
}

let countries: [Country] = [
    Country(name: "대한민국", language: "한국어", flag: "태극기"),
    Country(name: "미국", language: "영어", flag: "성조기")
]



//// 빈 딕셔너리 만드는 두 가지 방법
//
//// 1. 타입 추론
//let dicNames = [String: String]()
//
//// 2. 타입 명시 (Type Annotation)
//let dicOtherNames: [String: String] = [:]
//



let keys: [String] = ["이름", "별명", "좌우명"]
let values: [String] = ["홍길동", "소설주인공", "형을 형이라 부르지 못하고..."]

// 무식한 방법으로 위 내용들을 딕셔너리로 만들기
var gildong: [String: String] = [:]

for index in 0..<keys.count {
    let key: String = keys[index]
    let value: String = values[index]
    
    gildong[key] = value
}

print(gildong) // ["이름": "홍길동", "별명": "소설주인공", "좌우명": "형을 형이라 부르지 못하고..."]


// 책에 나오는 좀 더 세련된 방법
var actorInfo: [String: String] = Dictionary(uniqueKeysWithValues: zip(keys, values))

print(actorInfo) // ["좌우명": "형을 형이라 부르지 못하고...", "이름": "홍길동", "별명": "소설주인공"]
