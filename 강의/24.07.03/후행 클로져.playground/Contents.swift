import Foundation
import PlaygroundSupport

func calc(_ number1: Int, _ number2: Int, calcFunc: (Int, Int) -> Int) -> Void {
    print(calcFunc(number1, number2))
}

func add(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

calc(3, 5, calcFunc: add) // 8

calc(3, 5, calcFunc: { num1, num2 in
    return num1 - num2
}) // -2

// 후행 클로저:
// 맨 마지막 parameter가 클로저 타입을 요구하면
// 다음과 같이 클로저를 이어 붙이는 식으로 호출부를 완성할 수 있다
calc(3, 5) { $0 * $1 } // 15

calc(3, 5) { $0 + $1 }
calc(3, 5) { $0 - $1 }
calc(13, 5) { $0 / $1 }






let url = URL(string: "https://techit.education")!

// completeHandler 클로저 사용

let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
    guard let data else {
        print("nothing")
        return
    }
    
    print(String(data: data, encoding: .utf8)!)
}

task.resume()
