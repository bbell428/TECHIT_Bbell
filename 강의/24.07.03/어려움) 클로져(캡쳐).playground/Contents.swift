// countFunc를 호출하면
// () -> Int 타입의 함수(클로저)를 반환한다
func countFunc() -> () -> Int {
    
    var counter = 30
    
    func insideFunc() -> Int {
        // insideFunc 안에서 언급되는
        // counter는 countFunc에서 만들어진 변수이다.
        // 나중에 insideFunc가 실행되면
        counter += 10
        return counter
    }
    
    // counter는 계속 활용될거라서
    // countFunc가 호출 종료되어도
    // 이 counter라는 값은 계속
    // insideFunc가 활용하도록
    // 메모리에 남아있게 된다 (captured)
    return insideFunc
    
    // counter는 여기서 사라질까요? : No!!
}

// countFunc를 호출한 결과로
// insideFunc라는 것이 myClosure에 할당된다
let myClosure: () -> Int = countFunc()

// 그렇다면 myClosure를 실행해서 결과를 보자면
var result: Int = myClosure()
print(result)
result = myClosure()
print(result)
result = myClosure()
print(result)
