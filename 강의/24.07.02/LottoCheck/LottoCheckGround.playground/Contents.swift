import Foundation

var lottoArr: [Int] = []
var bonus: Int = 0

func makeLotto() -> [Int] {
    var randomLotto = Set<Int>()
    
    repeat {
        randomLotto.insert(Int.random(in: 1...45))
    } while randomLotto.count < 6
    
    repeat {
        bonus = Int.random(in: 1...45)
    } while randomLotto.contains(bonus)
        
    return randomLotto.sorted()
}

let prizeLotto = makeLotto() // 정답
let userLotto: [[Int]] = [
    makeLotto(),
    makeLotto(),
    makeLotto(),
    makeLotto(),
    makeLotto()
] // 구매 복권


print("당첨 복권: \(prizeLotto), 보너스: \(bonus)")

for Lotto in userLotto {
    var count: Int = 0
    
    for number in Lotto {
        if prizeLotto.contains(number) {
            count += 1
        }
    }
    
    if count == 6 {
        print("1등: \(Lotto)")
    } else if count == 5 {
        if Lotto.contains(bonus) {
            print("2등: \(Lotto)")
        } else {
            print("3등: \(Lotto)")
        }
    } else if count == 4 {
        print("4등: \(Lotto)")
    } else if count == 3 {
        print("5등: \(Lotto)")
    } else {
        print("꽝: \(Lotto)")
    }
}
