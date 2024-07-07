protocol Namable {
    var name: String { get }
    
    func nameLength() -> Int
    
    func nameAgain() -> String
}

// 클래스, 구조체, 연거형의 타입뿐만 아니라
// 프로토콜에도 익스텐션을 붙일 수 있다
extension Namable {
    func nameAgain() -> String {
        // Namable프로토콜에서는 name 프로퍼티가 있을거라 했으니까
        // 우리는 extension에서 name 프로퍼티를 쓸 수 있다
        return "\(name) \(name)"
    }
}

class MyName: Namable {
    // 저장 프로퍼티는 get, set다 있으니까 ok
    var name: String = "Ned"
    
    func nameLength() -> Int {
        return name.count
    }
}

class YourName: Namable {
    // 연산프로퍼티어도 조건만 맞으면 프로토콜 구현 ok
    var name: String {
        get {
            return "(이름없음"
        }
    }
    
    func nameLength() -> Int {
        return 0
    }
}
