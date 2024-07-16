// 두 변수의 값을 바꾸는
// temp공간을 이용한 swap 매커니즘

var a: Int = 34
var b: Int = 7

var temp: Int = a
// temp = 34, a = 34, b = 7

a = b
// temp = 34, a = 7, b = 7

b = temp
// temp = 34, a = 7, b = 34

// a = 7
// b = 34

print("\(a), \(b)")

print("--------------------------------")

// 매번 이렇게 타입마다 값 교환하는 함수들을 만들 수는 없지않나?

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    var temp = a
    a = b
    b = temp
}

func swapTwoFloats(_ a: inout Float, _ b: inout Float) {
    var temp = a
    a = b
    b = temp
}

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    var temp = a
    a = b
    b = temp
}

print("--------------------------------")

var col: Int = 1
var arg: Int = 0

print("콜롬비아 \(col) : \(arg) 아르헨티나")

// 제너릭으로 만들어봅시다
// 어떤 타입에 대한 요청이 되더라도 받아주도록
// 가상의 타입 T를 상상해봅시다
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    var temp = a
    a = b
    b = temp
}

// 다시 숫자를 맞바꿔봅시다
swapTwoValues(&col, &arg)

print("콜롬비아 \(col) : \(arg) 아르헨티나")
// 콜롬비아 1 : 0 아르헨티나
