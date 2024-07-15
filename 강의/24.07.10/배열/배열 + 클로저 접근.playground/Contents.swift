let names: [String] = ["잠만보", "꼬북이", "파이리", "푸린", "뮤츠", "이상해씨", ]

for name in names {
    print(name)
}

print("-----------")

// forEach라는 배열 메서드를 호출하면서
// 인자로 클로저를 넘기면, 내용들을 하나씩 꺼내어
// 해당 클로저를 실행한다
names.forEach({ (name: String) in
    print(name)
})

// 후행클로저로 더 단축해서 작성할 수 있다
names.forEach { name in
    print(name)
}

// 극단적으로 더 단축할 수 있다 (권장 안함)
names.forEach {
    print($0)
}
