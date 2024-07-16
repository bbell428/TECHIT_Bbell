extension String {
    func sayHello() -> String {
        let name: String = self
        return "Hello, \(name)"
    }
}

let name: String = "Ned"
print("\(name.sayHello())")
