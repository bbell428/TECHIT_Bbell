import Foundation

func getHTML(address: String) async -> String {
    var message: String = ""
    
    if let url = URL(string: address) {
        let requst: URLRequest = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            message = "데이터 확인 완료: \(address) (\(data.count.formatted()) bytes)"
            
            
        } catch {
            message = "데이터 확인 실패: \(address)"
        }
    } else {
        message = "주소 확인 실패 : \(address)"
    }
    
//    print(message)
    
    return message
}

// 동시에 모든 웹사이트 자료들을 가져와서, 모든 작업들이 다 완료되면 배열로 묶도록 기다리기
Task {
    async let message1 = getHTML(address: "https://naver.com")
    async let message2 = getHTML(address: "https://daum.net")
    async let message3 = getHTML(address: "https://techit.education")
    async let message4 = getHTML(address: "https://swift.org")
    async let message5 = getHTML(address: "https://apple.com")
    
    let messages: [String] = await [message1, message2, message3, message4, message5]
    
    for message in messages {
        print(message)
    }
}
