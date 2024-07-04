func sayHello() {
    print("Hello")
}

sayHello()

func buildMessageFor(name: String, count: Int) -> String {
    "\(name), you are customer number \(count)"
}

let message1 = buildMessageFor(name: "Ned", count: 2)
print(message1)

let message2 = buildMessageFor(name: "Tuna", count: 5)
print(message2)






func helloBrother(장남 첫째: String, 차남 막내: String) {
    print("우리집 형제들: \(첫째), \(막내)")
}

helloBrother(장남: "강원래", 차남: "강원미")






func buildGreetingFor(_ name: String?, count: Int) -> String {
    let customerName: String = if let name {
        name
    } else {
        "customer"
    }
    
    // 여기서 name과 count는 local parameter이다.
    return "\(customerName), you are customer number \(count)"
}

// 위 코드처럼 옵셔널 타입을 쓰기보다는
// 다음의 디폴트 값을 쓰는 게 더 좋을 수 있다.
func sayGreetringFor(_ name: String = "customer", count: Int) -> String {
    "\(name), you are customer number \(count)"
}





func sayHello(_ name: String) {
    print("Hello \(name)")
}

func sayHello(_ name1: String, _ name2: String) {
    print("Hello \(name1)")
    print("Hello \(name2)")
}

func sayHello(_ name1: String, _ name2: String, _ name3: String) {
    print("Hello \(name1)")
    print("Hello \(name2)")
    print("Hello \(name3)")
}

sayHello("Ned")
sayHello("Ned", "Tuna")
sayHello("Ned", "Tuna", "CH")

// 위와 같이 여러 항목들에 대해 매번 parameter 대응을 하지말고
// 가변적으로 준비시켜봅시다

func greeting(_ names: String ...) {
    for name in names {
        print("Hi \(name)")
    }
}

greeting("Ned")
greeting("Ned", "Tuna")
greeting("Ned", "Tuna", "CH")




func sayHello(name: String) {
    // shadow copy 생성
    var name = name
    
    name += "님"
    print("\(name), 안녕하세요")
}

sayHello(name: "홍길동")





