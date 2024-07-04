import Foundation

// 1부터 45 사이의 정수 만들기
func getNumber() -> Int {
    Int.random(in: 1...45)
}

// 당첨번호 6개와 보너스 번호 만들기
func getResults() -> (results: [Int], bonus: Int) {
    var resultSet: Set<Int> = []
    
    repeat {
        resultSet.insert(getNumber())
    } while resultSet.count < 7
    
    // Set 데이터로부터 Array를 만들기
    var results: [Int] = Array(resultSet)
    
    let bonus: Int = results.last ?? 0
    results.removeLast()
    
    return (results, bonus)
}

// 응모번호 6개 숫자 만들기
func getRequest() -> [Int] {
    var requestSet: Set<Int> = []
    
    repeat {
        requestSet.insert(getNumber())
    } while requestSet.count < 6
    
    // Set 데이터로부터 Array를 만들어 반환하기
    return Array(requestSet)
}

// 응모번호 모음 5개 만들기 (모음마다 6개 숫자 담김)
func getRequests() -> [[Int]] {
    var requests: [[Int]] = []
    
    for _ in 0..<5{
        requests.append(getRequest())
    }
    
    return requests
}

let (results, bonus) = getResults()

print("당첨번호 : \(results)")
print("보너스번호 : \(bonus)")

let requests = getRequests()

for request in requests {
    print("응모번호 모음 : \(request)")
    
    // 이 변수는 해당 for문이 한바퀴 돌면
    // 메모리에서 사라진다
    var count: Int = 0
    var isBonus: Bool = false
    
    for requestNumber in request {
        
        // 해당 응모번호가 당첨번호 안에 있는지 확인
        for resultNumber in results {
            if requestNumber == resultNumber {
                // print("같은 번호 확인! \(requestNumber)")
                count += 1
            }
            
            if requestNumber == bonus {
                isBonus = true
            }
        }
    }
    
    // print("\(count)개의 같은 번호 확인함")
    
    if count == 6 {
        print("1등")
    } else if count == 5 && isBonus {
        print("2등")
    } else if count == 5 {
        print("3등")
    } else if count == 4 {
        print("4등")
    } else if count == 3 {
        print("5등")
    }
}
