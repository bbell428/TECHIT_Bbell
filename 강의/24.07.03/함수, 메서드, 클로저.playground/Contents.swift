
func sayHello(name: String) -> String {
    let message: String = "Hello, \(name)"
    print(message)
    return message
}

// return될 값의 타입이 있다면, 그냥 호출하지말고
// _라도 받아올 준비를 해둡시다
_ = sayHello(name: "Ned")
_ = sayHello(name: "Tuna")
