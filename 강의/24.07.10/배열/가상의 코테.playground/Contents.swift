/*
 가상의 코딩테스트 문제
 
 로또 당첨 숫자들을 담는 자료 구조를 Stack으로 구현해
 숫자를 하나씩 입력하고 다시 꺼내면서 출력하도록 만들자
 */

struct LottoStack {
    private var numbers: [Int] = []
    
    mutating func push(_ number: Int) { // 구조체는 값타입 즉 불변성을 띄기 때문에 직접 수정이 어려워 mutating을 사용하여 수정할 수 있게 해준다.
        numbers.append(number)
    }
    
    mutating func pop() -> Int? {
        if numbers.isEmpty {
            return nil
        } else {
            return numbers.removeLast()
        }
    }
}

var lotto: LottoStack = LottoStack()

lotto.push(1)
lotto.push(2)
lotto.push(3)
lotto.push(4)
lotto.push(5)
lotto.push(6)
print(lotto)

for _ in 0..<10 {
    let number: Int? = lotto.pop()
    
    if let number {
        print("\(number)")
    } else {
        print("더 이상 번호가 없습니다.")
    }
}
