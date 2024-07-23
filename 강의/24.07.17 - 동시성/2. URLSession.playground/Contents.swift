import Foundation

func getHTML(address: String) {
    if let url = URL(string: address) {
        let requst: URLRequest = URLRequest(url: url)
        
        // Singleton패턴으로 제공되는
        // URLSession 클래스에서 정의한
        // shared라는 타입 인스턴스
        URLSession.shared.dataTask(with: requst) { data, response, error in
            if let data {
                print("데이터 확인 완료: \(address) (\(data.count.formatted()) bytes)")
            } else {
                print("데이터 확인 실패: \(address)")
            }
        }.resume()
    } else {
        print("주소 확인 실패 : \(address)")
    }
}

// 다음의 호출들은 제각각 URLSession들이 동시에 일을 벌이게 만들어서
// 출력 결과의 순서는 매번 달라진다
getHTML(address: "https://naver.com")
getHTML(address: "https://daum.net")
getHTML(address: "https://techit.education")
getHTML(address: "https://swift.org")
getHTML(address: "https://apple.com")
