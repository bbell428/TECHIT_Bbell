func buildName() -> (String) -> Void {
    var name: String = "Ned"
    
    // setName 함수의 타입은 (String) -> Void
    func setName(nextName: String) {
        name = nextName
        
        print(name)
    }
    
    return setName
}

// 아래 코드를 실행하면
// buildName함수를 실행시켜 받아오는
// setName(정확히는 (String) -> Void 타입의 함수)를
// myFunc에 할당한다
let myFunc: (String) -> Void = buildName()

// myFunc가 곧 setName일텐데,
// setName 안의 name이라는 변수는
// 원래 buildName이라는 더 큰 외부의 함수에서 생성한 것이다.
// buildName이 호출 종료되면
// 원래 name도 메모리에서 사라져야한다.
// 그런데 name이 살아서 반응한다. 왜냐하면,
// myFunc가 계속 쥐고 활용하기 때문에. (Captured)
myFunc("Tuna")
myFunc("CH")

// 캡처되었다의 뜻은...
// 원래 함수 호출 등으로 메모리에서 역할을 다 하고 사라져야할 데이터가
// 다른 함수가 계속 사용한다는 이유로
// 제때 사라지지 못하고, 계속 다른 함수에 의해 메모리에 남아있는 경우

// 캡처드는 당장은 면접용 상식으로 알아봅시다
// 더 정확히는 캡처드 상황처럼 제 때 데이터가 사라지지 못하는 상황들을 고려한 ARC(자동 참조 카운팅) 개념이 활용사례까지 더 중요하긴 합니다. : self, strong, weak




// ------------------------------------------------------------------------


func makeIncrementer(amount: Int) -> () -> Int {
    
    var runningTotal = 0
    var amount = amount
    
    func incrementer() -> Int {
        runningTotal += amount
        amount += 2
        
        print("runningTotal: \(runningTotal) amount: \(amount)")
        return runningTotal
    }
    
    return incrementer
}

let incrementByTen = makeIncrementer(amount: 10)
print(incrementByTen()) // 10
print(incrementByTen()) // 20
print(incrementByTen()) // 30

/*
 runningTotal: 10 amount: 12
 10
 runningTotal: 22 amount: 14
 22
 runningTotal: 36 amount: 16
 36
 */
