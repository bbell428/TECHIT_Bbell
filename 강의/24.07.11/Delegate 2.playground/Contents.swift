// 클로저가 보편적으로 활용되는 Swift 이전에
// Objective-C가 주로 쓰던 패턴

protocol MyComponentDelegate {
    func requestComponentName(_ component: MyComponent) -> String
    func requestComponentGreeting(_ component: MyComponent, name: String) -> String
}

class MyComponent {
    var delegate: MyComponentDelegate?
    
    func sayHello() {
        if let name = delegate?.requestComponentName(self) {
            if let greeting = delegate?.requestComponentGreeting(self, name: name) {
                print("\(greeting)")
            }
        }
    }
}

struct HelloOne: MyComponentDelegate {

    let component: MyComponent = MyComponent()
    
    init() {
        component.delegate = self
    }
    
    func requestComponentName(_ component: MyComponent) -> String {
        return "Ned Park"
    }

    func requestComponentGreeting(_ component: MyComponent, name: String) -> String {
        return "Hello \(name)!"
    }
}


struct HelloTwo: MyComponentDelegate {

    let component: MyComponent = MyComponent()
    
    init() {
        component.delegate = self
    }
    
    func requestComponentName(_ component: MyComponent) -> String {
        return "Steve Jobs"
    }

    func requestComponentGreeting(_ component: MyComponent, name: String) -> String {
        return "Hi \(name)!"
    }
}


let one: HelloOne = HelloOne()
one.component.sayHello()

let two: HelloTwo = HelloTwo()
two.component.sayHello()

// 만약 Swift 다운 클로저를 사용했다면...

struct MySomething {
    var getName: (() -> String)?
    var getGreeting: ((String) -> String)?
    
    func sayHello() {
        if let getName {
            let name = getName()
            
            if let getGreeting {
                let greeting = getGreeting(name)
                print("\(greeting)")
            }
        }
    }
}

struct SomeOne {
    var something: MySomething = MySomething()
    
    init() {
        something.getName = { () -> String in
            return "Bill Gates"
        }
        
        something.getGreeting = { (name: String) -> String in
            return "Hello \(name)"
        }
    }
}

struct SomeTwo {
    var something: MySomething = MySomething()
    
    init() {
        something.getName = { () -> String in
            return "Elon Musk"
        }
        
        something.getGreeting = { (name: String) -> String in
            return "Hi \(name)"
        }
    }
}

var someOne: SomeOne = SomeOne()
someOne.something.sayHello()

var someTwo: SomeTwo = SomeTwo()
someTwo.something.sayHello()

// 아니면 sayHello에 바로 클로저를 요구하도록 해서 가는 방법도...

struct MyAnother {
    var getName: (() -> String)?
    var getGreeting: ((String) -> String)?
    
    mutating func readyHello(getName: (() -> String)?, getGreeting: ((String) -> String)?) {
        if let getName {
            self.getName = getName
        }
        
        if let getGreeting {
            self.getGreeting = getGreeting
        }
    }
    
    func sayHello() {
        if let getName {
            let name = getName()
            
            if let getGreeting {
                let greeting = getGreeting(name)
                print("\(greeting)")
            }
        }
    }
}

struct AnotherOne {
    var another: MyAnother = MyAnother()
    
    init() {
        another.readyHello(getName: { () -> String in
            return "Heungmin Son"
        }, getGreeting: { (name: String) -> String in
            return "Hello \(name)"
        })
    }
}

struct AnotherTwo {
    var another: MyAnother = MyAnother()
    
    init() {
        another.readyHello {
            "Minjae Kim"
        } getGreeting: { name in
            "Hi \(name)"
        }
    }
}

var anotherOne: AnotherOne = AnotherOne()
anotherOne.another.sayHello()

var anotherTwo: AnotherTwo = AnotherTwo()
anotherTwo.another.sayHello()
