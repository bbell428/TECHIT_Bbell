/*
 용어 정리
 */

// 바깥에 날것 그대로 함수가 있으면 "함수"
func hello() {
    print("Hello")
}

struct Student {
    // 타입 선언부 안에 함수가 있으면 "메서드"(method)
    func hello() {
        print("Hello")
    }
}

// 단독 타입값 하나만 얘기하면 "상수" 또는 "변수"
let name: String = "Ned"
var myName: String = name

// 배열, 딕셔너리, 튜플 같은 컬렉션에 대해서는
// "불변형", "가변형" 컬렉션이라 부른다

// "불변형" 컬렉션
let names: [String] = ["Ned"]

// "가변형" 컬렉션
var myNames: [String] = names
myNames.append("Tuna")
