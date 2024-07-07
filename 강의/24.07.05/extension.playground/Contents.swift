extension String {
    
    // 몇 단어가 있는지 확인해보는 함수
    func getWordCount() -> Int {
        let words: Int = self.split(separator: " ").count
        return words
    }
    
    // 사람 이름마다 "님"자를 붙이는 함수
    // Sting은 구조체로 만들어져서
    // 해당 내용을 직접 건드리는 경우라면
    // 메서드 앞에 mutating이라고 붙여줘야한다
    mutating func addNim() {
        self = self + "님"
    }
}


var name = "커피빈에 갈 수 없어 스타벅스 오신"
print(name.getWordCount())
name.addNim()
print(name)
