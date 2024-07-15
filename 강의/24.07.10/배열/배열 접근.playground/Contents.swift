//var names: [String] = ["스티브유", "조진웅", "카리나", "변우석"]
//let actors: [String] = ["류승용", "하정우", "유해진"]
//
//var stars: [String] = []
//
//// stars에 names와 actors 내용들을 붙여 담는 귀찮은 방법
//for name in names {
//    stars.append(name)
//}
//
//for actor in actors {
//    stars.append(actor)
//}
//
//print(stars)
//// 결과 : ["스티브유", "조진웅", "카리나", "변우석", "류승용", "하정우", "유해진"]
//
//
//// stars에 names와 actors 내용들을 붙여 담는 "신박한" 방법
//stars = names + actors
//
//print(stars)
//// 결과 : ["스티브유", "조진웅", "카리나", "변우석", "류승용", "하정우", "유해진"]


// ================================================================================================


//var names: [String] = ["god", "뉴진스", "아이브", "에스파", "스트레이키즈"]
//
//if names.count > 1 {
//    print("\(names.count) 그룹의 아티스트들이 드림콘서트에 모입니다.")
//} else if names.count > 0 {
//    print("\(names.count) 그룹의 아티스트가 단독 콘서트를 엽니다.")
//} else {
//    print("오늘은 콘서트가 없습니다.")
//}


// ================================================================================================


//var names: [String] = ["god", "뉴진스", "아이브", "에스파", "스트레이키즈"]
//
//// 이렇게 직접 index 번째를 건드리는 코드는 좋지 않습니다.
//for index in 0..<5 {
//    print(names[index])
//}
//
//// 대신 간접적으로 접근하는 방법들을
//// swift에서는 권장합니다.
//print(names.first ?? "(내용없음)")
//print(names.last ?? "(내용없음)")
//
//for name in names {
//    print(name)
//}
//
//for (index, name) in names.enumerated() {
//    if index > 2 {
//        print("\(index)번째 출연할 아티스트는 \(name)입니다.")
//    }
//}


// ================================================================================================



//var names: [String] = ["god", "뉴진스", "아이브", "에스파", "스트레이키즈"]
//
//print(names)
//
//// 특정 내용 접근해서 값 바꾸기
//names[2] = "아이유"
//
//print(names)
//
//for name in names {
//    // name은 names에서 하나씩 복제되어 나온
//    // 상수값이라 내용 변경도 안되고
//    // 변경한다해도 실제 names에는 영향이 없다
//    
//    // name = "(오늘 바빠서 못오심)"
//}
//
//// 진짜 바꾸고 싶으면 이렇게 해봅시다
//for (index, name) in names.enumerated() {
//    names[index] = "\(name) 자기님들"
//}
//
//print(names)



// ================================================================================================



//var names: [String] = ["god", "뉴진스", "아이브", "에스파", "스트레이키즈"]
//
//// 원래 섭외된 출연진들
//print(names) // ["god", "뉴진스", "아이브", "에스파", "스트레이키즈"]
//
//// 하지만 출연순서는 바꾸고 싶었어요
//let lineup: [String] = names.shuffled()
//
//print(lineup) // ["뉴진스", "스트레이키즈", "god", "아이브", "에스파"]
//
//print(names) // ["god", "뉴진스", "아이브", "에스파", "스트레이키즈"]
//
//// names를 섞어서 다시 구성하려면 이렇게 해야 합니다
//names = names.shuffled()
//
//// 또는 이렇게 하면 자체적으로 섞어서 업데이트 됩니다.
//names.shuffle()
//print(names)
//
//let winner: String = names.randomElement() ?? "(오늘은 결방)"
//print("오늘의 1위 \(winner)")



// ================================================================================================




var metros: [String] = [
    "주안행",
    "수원행",
    "인천행",
    "수원행",
    "주안행",
    "서동탄행"
]

// 마지막 내용만 지우기
var removed = metros.removeLast()

print("\(removed) 데이터가 삭제되었습니다")
print(metros)

// index를 알고 해당 내용 지우
removed = metros.remove(at: 1)

print("\(removed) 데이터가 삭제되었습니다")
print(metros)

// 만약에 "주안행" 데이터들을 모두 지운다면?
// 이 코드가 오류를 내는 이유는
// for-in은 metros의 복제품으로 돌리는 중인데,
// 중간에 metro 원본을 변경해서
// 나중엔 index번째 지우려고 할때 없는 곳을 건드리려고 하기때문
for (index, name) in metros.enumerated() {
    print("\(index)번째 데이터 \(name)과 '주안행'비교")
    
    if name == "주안행" {
        removed = metros.remove(at: index)
        print("\(removed) 데이터가 삭제되었습니다")
        print(metros)
    }
}
