// 아무것도 반환하는 것이 없다면 Void라고 쓰고
// 아니면 생략 가능
func sayHello() -> Void {
    print("Hello World")
}

sayHello() // Hello World 출력

let showHello: () -> Void = sayHello

showHello() // Hello World 출력

// 이 함수의 타입 : (Int, Int) -> Int
func add(_ number1: Int, _ number2: Int) -> Int {
    return number1 + number2
}

var calc: (Int, Int) -> Int = add

print(calc(3, 5)) // 8

func sub(_ number1: Int, _ number2: Int) -> Int {
    return number1 - number2
}

func multiply(_ number1: Int, _ number2: Int) -> Int {
    return number1 * number2
}

calc = sub
print(calc(3, 5)) // -2

calc = multiply
print(calc(3, 5)) // 15

// 클로저로도 만들 수 있습니다
calc = { (number1: Int, number2: Int) -> Int in
    return number1 > number2 ? number1 : number2
}

print(calc(3, 5)) // 5

// 클로저는 얼마든지 짧게 축약 가능합니다
calc = { $0 + $1 }

print(calc(3, 5)) // 8
