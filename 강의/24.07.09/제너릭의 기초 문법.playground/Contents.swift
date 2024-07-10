// 제너릭의 기본 컨셉
// 함수나 메서드 또는 특정 구조체 등에서
// 매번 다른 타입들에 맞춰서 코드를 만들지 말고
// 공용으로 가상의 타입을 설정해서
// 해당 타입이라면 이렇게 처리해주자로 가보는 것
func greeting<T>(message: T) {
    print("Hello \(message)")
}

greeting(message: "반갑습니다") // Hello 반갑습니다
greeting(message: 123) // Hello 123


/*
func showAdd(_ a: Int, _ b: Int) {
    print("\(a + b)")
}
*/



// ---------------------------------------------------------



// 위 함수를 제너릭으로 다시 구성
func showAdd<T: FloatingPoint>(_ a: T, _ b: T) {
    print("\(a + b)")
}

showAdd(5, 3) // Int
showAdd(10.4, 5.1) // Double

// String는 FloatingPoint 프로토콜을 따르지 않아서 적용 불가
//showAdd("아이폰", "맥북")


// ---------------------------------------------------------


//// 두 개 이상의 가상의 타입이 언급되는
//// 제너릭 함수
//func showAdd<T, P>(_ a: T, _ b: P) {
//    print("\(a)")
//    print("\(b)")
//}
