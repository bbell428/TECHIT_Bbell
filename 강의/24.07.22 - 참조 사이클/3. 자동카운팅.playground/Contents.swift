class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}


class Apartment {
    let unit: String
    var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: Person? = Person(name: "John") // RC +1
john = nil // RC -1 => 0가 되면서 메모리에서 삭제!
// John is being deinitialized

var unit4A: Apartment? = Apartment(unit: "2-1")
unit4A = nil
// Apartment 2-1 is being deinitialized




// 강한참조가 has-a 관계로 설정만 되고, 내용은 nil로 두는 경우
john = Person(name: "John Appleseed") // john RC +1 => 1
unit4A = Apartment(unit: "4A")

// 강한 참조 사이클 발생!
john!.apartment = unit4A
unit4A!.tenant = john // john RC +1 => 2

john = nil // john RC -1 => 1
unit4A = nil

// 위 내용들은 둘 다 RC가 1로 남아있어서
// 메모리에서 사라지지 않는다
// 그래서 deinit도 호출되지 않는다.
