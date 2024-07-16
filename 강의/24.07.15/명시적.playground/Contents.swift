let point1: Int = 3
let point2: Double = 3.14

// Swift는 "명시적" 타입 변환이 필요하다

let result: Int = point1 + Int(point2)
print(result) // 6

let result2: Double = Double(point1) + point2
print(result2) // 6.140000000000001




// 부동소수점 값을 정수형으로 변환하면
// 소수점 이하는 버림한다
print("\(Int(3.14))") // 3
print("\(Int(99.9))") // 99
print("\(Int(-3.14))") // -3
