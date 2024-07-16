/*
 Swift에서는 func로 만드는 함수는
 이름이 이미 붙어있는 클로저이고
 그냥 클로저는 이름 없이 존재하다가
 어디에 할당하면 그제야 이름 붙은 클로저가 된다
 */

func sayHello() {
    print("Hello")
}

let sayHi: () -> Void = { () -> Void in
    print("Hi")
}

var nextWork: () -> Void = sayHi
nextWork() // Hi

nextWork = sayHello
nextWork() // Hello

// 이름은 없지만 {...}으로 실체가 있는 클로저는
// ()를 붙여서 바로 실행해볼 수도 있다.
let result: String = { () -> String in
    return "Good morning"
}()

print(result) // Good morning


print("-----------------------------------------------")


func work(nextWork: () -> Void) {
    print("일하자. 다 끝났으면 nextWork를 하자")
    nextWork()
}

work(nextWork: {
    print("다음 일 하는 중...")
})

work {
    print("다음 일 하는 중...")
}

func sayHello2() {
    print("다음 일 하는 중...")
}

work(nextWork: sayHello2)


// 출력 결과:
//일하자. 다 끝났으면 nextWork를 하자
//다음 일 하는 중...


print("-----------------------------------------------")



struct Student {
    var name: String
    
    // 기존의 전통적인 메서드는
    // Swift 입장에선 이름이 있는 클로저인 함수들이었다
    func sayHello() {
        print("\(name)님 안녕하세요")
    }
    
    // 이름이 없는 클로저를 프로퍼티에 지정해서
    // 메서드처럼 쓸 수 있을까? : OK
    var sayHi: () -> Void = {
        print("님 어서오고")
    }
}

var ned: Student = Student(name: "Ned Park")

ned.sayHello() // Ned Park님 안녕하세요

ned.sayHi() // 님 어서오고

// 심지어, 프로퍼티까 기능을 따로 바꿔서 지정할 수도 있다
ned.sayHi = {
    print("님 어서옵쇼")
}

ned.sayHi() // 님 어서옵쇼
