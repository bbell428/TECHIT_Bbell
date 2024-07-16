var names: [String] = ["KIA", "삼성", "LG", "두산", "SSG", "NC", "KT", "한화", "롯데", "키움"]

// 따로 함수 만들어서 정렬에 필요한 클로저로 지정해줄 수 있다
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames: [String] = names.sorted(by: backward)
print(reversedNames)
// ["한화", "키움", "삼성", "롯데", "두산", "SSG", "NC", "LG", "KT", "KIA"]

// ----------------------------------

// 클로저를 바깥에 이름지어 할당시켜 만들고 써도 된다
var backwardClousure: (String, String) -> Bool
backwardClousure = { (s1: String, s2: String) -> Bool in
    return s1 > s2
}

reversedNames = names.sorted(by: backwardClousure)
print(reversedNames)

// ----------------------------------

// 하지만 언제 함수 이름지어 만들고 하겠나?
// 클로저로 바로 by에 코드까지 심어주자!
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(reversedNames)

// ----------------------------------

// 위 코드는 한줄로 작성도 가능합니다
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })
print(reversedNames)

// ----------------------------------

// 컨텍스트로 타입 추론 (Inferring Type From Context):
// sorted에서 by 항목으로 요구되는 타입은
// 현재 (String, String) -> Bool
// 이 정보를 알고있다 생각해서 축약/생략 가능하다
reversedNames = names.sorted(by: { s1, s2 in
    return s1 > s2
})
print(reversedNames)


// ----------------------------------

// 단일 표현 클로저의 암시적 반환 (Implicit Returns from Single-Expression Closures)
// 클로저 내용에 return 명령줄 하나만 있어서 return은 생략 가능
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
print(reversedNames)

// ----------------------------------

// 짧은 인수 이름 (Shorthand Argument Names)
reversedNames = names.sorted(by: { $0 > $1 })
print(reversedNames)

// ----------------------------------

// 연산자 메서드 (Operator Methods)
reversedNames = names.sorted(by: > )
print(reversedNames)

// 우리가 만든 타입이 > 같은 비교연산자에 대응하게 하려면
// Comparable 프로토콜을 참고하세요


// ----------------------------------

// 후행클로저
reversedNames = names.sorted { s1, s2 in s1 > s2 }
print(reversedNames)

reversedNames = names.sorted { $0 > $1 }
print(reversedNames)
