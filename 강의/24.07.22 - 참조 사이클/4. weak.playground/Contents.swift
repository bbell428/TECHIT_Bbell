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
    weak var tenant: Person?
    
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
unit4A!.tenant = john // john RC +0 (weak라서)

// weak나 unowned 키워드는
// 다음의 코드가 추가된 것 처럼 처리해준다
//john?.apartment = nil
unit4A?.tenant = nil // weak 관계라서 ARC 작동 안함

john = nil // john RC -1 => 1
print("\(unit4A?.unit ?? "")") // 4A
print("\(String(describing: unit4A?.tenant))") // nil
unit4A = nil
