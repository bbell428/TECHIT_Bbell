import Foundation

print("Int8의 최솟값 = \(Int8.min)")
print("Int8의 최대값 = \(Int8.max)")

print("Int32의 최솟값 = \(Int32.min)")
print("Int32의 최대값 = \(Int32.max)")

print("UInt32의 최대값 = \(UInt32.max)")

print("Int64의 최솟값 = \(Int64.min)")
print("Int64의 최대값 = \(Int64.max)")

print("Int의 최솟값 = \(Int.min)")
print("Int의 최대값 = \(Int.max)")

// -----------------------------------------------------------------

let price: Float = 3.99
let height: Double = 207.213

let weight = 45.321 // Double로 처리됨

let mix1: Double = Double(price) * weight
let mix2: Double = height * weight

// -----------------------------------------------------------------

let count: Int = 5

if count > 3 {
    print("3보다 큰 값!")
}

//let result: Bool = false
let result: Bool = count > 3

if result {
    print("참")
}

if !result {
    print("거짓")
}

// swift 5.9의 새로운 형식
var myResult = if count > 3 {
    "참"
} else {
    "거짓"
}

print("\(myResult)")

// -----------------------------------------------------------------

let alpha = "A" // String
let beta: String = "Beta"

let alphaBeta: String = alpha + beta

// -----------------------------------------------------------------

func sayHello() {
    let name: String = "Ned"
    
    print("Hello, \(name)")
    
    // 자동 참조 카운팅(ARC)
    // name은 더 쓸모다 없네? 그럼 name을 메모리에서 제거하는 코드를 여기에 추가하야지!
}

sayHello()

// print("Hi, \(name)") // 범위 밖이라 안됨

// -----------------------------------------------------------------

// Type Safe!

var name: String = "Ned"

name = "Tuna"

// name = 4885


// -----------------------------------------------------------------

var myName: String // myName이란 이름으로 String타입에 필요한 메모리 공간 확보
myName = "Ned" // 해당 메모리 공간에 "Ned"라는 값을 할당(저장)

// 타입 추론에서는 문제가 될 수 있다
// var yourName = "Tuna"
//var yourName // yourName이 어떤 타입일지 모르기 때문에 메모리 공간 확보 불가능
//yourName = "Tuna"

// -----------------------------------------------------------------

let mySchool = ("AppSchool", "iOS", 6)
print(mySchool.0)
print(mySchool.1)
print(mySchool.2)

//let (schoolName, osName, season) = mySchool
let (schoolName, osName, season) = ("AppSchool", "iOS", 6)
print(schoolName)
print(osName)
print(season)

let (mySchoolName, _ , mySeason) = mySchool

// -----------------------------------------------------------------

var index: Int?

index = 4

// 최신 옵셔널 바인딩(if-let)
if let index {
    // index가 nil이 아닐때 처리
    // 이 안에서는 index는 Int 타입이다 (옵셔널? 아님)
    print(index)
} else {
    print("index가 nil이라서 죄송합니다.")
}

// 짧게 쓰는 옵셔널 바인딩(??)
let myIndex = index ?? 0
print(myIndex)

// -----------------------------------------------------------------

// 리터럴(Literal) - 원시값 : 따로 타입 이름 안 적어도 해당 타입임을 알 수 있는 기본 데이터 값 형태

// String 타입의 리터럴 : "Hello World"
let message: String = "Hello World"
print(message)
print("Hello World")

print(message.count)
print("Hello World".count)

if message.isEmpty {
    print("메시지가 비어있습니다")
}

if "Hello World".isEmpty {
    print("메시지가 비어있습니다")
}

// Int의 리터럴도 알아봅시다

let number1: Int = 3
let number2: Int = 5
let result2: Int = number1 + number2

print(3 + 5)

print(39800.formatted()) // 39,800

// -----------------------------------------------------------------

// 옵셔널 바인딩 사례

//let url = URL(string: "https://techit.education")!
//
//// async/await 사용
//
//func fetchData(from url: URL) async -> Data? {
//    // await 키워드로 비동기 작업의 결과를 기다림
//    do {
//        let (data, _) = try await URLSession.shared.data(from: url)
//        return data
//    } catch {
//        return nil
//    }
//}
//
//Task {
//    if let data = await fetchData(from: url) {
//        print(String(data: data, encoding: .utf8)!)
//    } else {
//        print("nothing")
//    }
//}

// -----------------------------------------------------------------

struct Person {
    var name: String
    var address: Address? // 옵셔널 타입 프로퍼티
}

struct Address {
    var city: String
}

let person = Person(name: "Alice", address: Address(city: "Seoul"))
let city: String? = person.address?.city // 옵셔널 체이닝
print(city)

// -----------------------------------------------------------------

let myStringNumber: String = "39800"
let myIntNumber: Int = Int(myStringNumber) ?? 0 // 39,800

let yourStringNumber: String = "HelloWorld"
let yourIntNumber: Int = Int(yourStringNumber) ?? -1 // -1

let youngStringNumber: String = "H3e9l8l0o0"
let youngIntNumber: Int = Int(youngStringNumber) ?? -10 // -10

// -----------------------------------------------------------------


