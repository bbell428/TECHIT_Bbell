import Foundation

func getHTML(_ urlString: String) {
    // 주소로부터 URL 인스턴스를 만들 수 없다면 (인터넷 주소로 부적합한 문자열일때)
    // 함수를 끝내자
    // guard를 통화했다면 url을 그대로 사용할 수 있다
    guard let url = URL(string: urlString) else {
        return
    }
    
    // URLSession에는 singleton 인스턴스인 shared가 존재한다.
    // 따로 우리가 URLSession타입의 인스턴스를 만들어 초기화시키지 않고도
    // URLSession 이름에 바로 shared를 언급하면 일 시킬 수 있다.
    let task: URLSessionDataTask = URLSession.shared.dataTask(with: url) { data, response, error in
        // dataTask(with:) 메서드는 지정된 URL에 대해 데이터 태스크를 시작하고, 데이터 전송이 완료되었을 때 클로저를 호출합니다.

        guard let data else {
            print("데이터 없음")
            return
        }
        
        // print("\(response)") // 응답 코드 모음
        
        if let error {
            print("\(error.localizedDescription)")
            return
        }
        /*
         response에 다음의 내용이 있어서 반영해 String 추출
         "Content-Type" =     (
             "text/html; charset=utf-8"
         );
         */
        if let result: String = String(data: data, encoding: .utf8) {
            print(result)
        } else {
            print("내용 없음")
        }
    }
    
    task.resume()
    print("일 시켰음")
}

getHTML("https://techit.education")
getHTML("https://naver.com")
