class MyClass {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct MyStruct {
    var name: String
}

// 위와 같이 class(참조 타입)도 만들고
// struct(값 타입)도 만들어 각각 배열에 적용합시다.

// 배열에 실제 들어가는 것은
// 각 항목의 데이터 공간에 담긴 값들이 아니라
// 해당 데이터 공간 위치를 알려주는 참조값들이다
let myClasses: [MyClass] = [
    MyClass(name: "Ned"),
    MyClass(name: "Tuna"),
]

// 그래서 그 위치의 내용을 직접 수정하는 것은
// 가능하다! 이것이 바로 참조타입
myClasses[0].name = "Ned Park"

let myStructs: [MyStruct] = [
    MyStruct(name: "Ned"),
    MyStruct(name: "Tuna"),
]

// myStructs는 불변형 컬렉션이라서 아래 코드는 안된다
// myStructs[0].name = "Ned Park"

for item in myClasses {
    print(item.name)
}

for item in myStructs {
    print(item.name)
}
