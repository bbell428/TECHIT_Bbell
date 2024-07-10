class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    // 그냥 타입 메서드
    static func sayHi() {
        print("Hi")
        
        // 타입 메서드는 인스턴스가 메모리에
        // 없는 상태에서 타입에 직접 물어보기 때문에
        // 인스턴스의 프로퍼티를 활용할 수 없다
        // print("Hi \(name)")
    }
    
    // 그냥 인스턴스 메서드
    func sayHello() {
        print("Hello \(name)")
    }
}

// 타입 메서드는 타입 이름에 바로 호출만 가능
Person.sayHi() // Hi

let ned: Person = Person(name: "Ned Park")
ned.sayHello() // Hello Ned Park
// ned.sayHi() // 안됨
