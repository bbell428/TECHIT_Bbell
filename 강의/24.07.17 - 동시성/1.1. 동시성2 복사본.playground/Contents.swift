import Foundation

// 여행 가기 전에 해야할 일들
let todos: [String] = ["여권", "세면도구", "옷", "충전기", "블루투스스피커", "보조배터리", "가방"]

func prepareTour(_ name: String, gap: UInt32) {
    for todo in todos {
        sleep(gap)
        print("[\(name)] \(todo) 챙겼어요")
    }
    
    print("[\(name)] 다 챙겼습니다")
}

DispatchQueue.global(qos: .default).async {
    prepareTour("Ned", gap: 3)
}

DispatchQueue.global(qos: .default).async {
    prepareTour("Tuna", gap: 2)
}

DispatchQueue.global(qos: .default).async {
    prepareTour("CH", gap: 1)
}

// 이 코드에선 누구 한명 다 끝날 때를 확인해서
// 함께 여행 출발 못합니다!
