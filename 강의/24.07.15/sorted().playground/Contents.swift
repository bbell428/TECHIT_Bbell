// 현재 결승전 아르헨티나 선수들(등번호)
var players: Set<Int> = [
    23,
    4, 13, 25, 3,
    7, 20, 24,
    11, 10, 9
]

// 메시가 뛰고있나 확인해봅시다
if players.contains(10) {
    print("메시는 현재 뛰고 있습니다")
}

print("\(players)")
// [23, 11, 9, 24, 4, 10, 3, 7, 20, 13, 25]
// 실행마다 결과는 다르게 나온다

// 현재 선수들 목록을 출력해봅시다
for player in players {
    print("\(player)")
}

print("--------")

print(players.sorted())
// Set에 정렬 메서드를 사용하면 고정된 배열의 결과를 받는다
// [3, 4, 7, 9, 10, 11, 13, 20, 23, 24, 25]

for player in players.sorted() {
    print("\(player)")
}
