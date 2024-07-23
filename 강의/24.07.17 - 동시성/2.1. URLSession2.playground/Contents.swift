import Foundation

func getHTML(address: String) async {
    if let url = URL(string: address) {
        let requst: URLRequest = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            print("데이터 확인 완료: \(address) (\(data.count.formatted()) bytes)")
            
        } catch {
            print("데이터 확인 실패: \(address)")
        }
    } else {
        print("주소 확인 실패 : \(address)")
    }
}

// 순서에 맞춰 앞의 일이 다 끝날 때까지 기다리고 다음 일을 하게 만들기
Task {
    await getHTML(address: "https://naver.com")
    await getHTML(address: "https://daum.net")
    await getHTML(address: "https://techit.education")
    await getHTML(address: "https://swift.org")
    await getHTML(address: "https://apple.com")
}
