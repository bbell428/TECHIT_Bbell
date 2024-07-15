import Foundation

enum GettingHTMLError: Error {
    case urlError
    case urlSeesionError
}

func getHTML(from urlString: String) async throws -> Data {
    
    // url이 정상적으로 만들어지는가?
    guard let url = URL(string: urlString) else {
        throw GettingHTMLError.urlError
    }
    
    // url에서 데이터 가져오기...
    
    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        print(response)
        
        return data
    } catch {
        throw GettingHTMLError.urlSeesionError
    }
}

do {
    let data: Data = try await getHTML(from: "https://techit.education")
    if let result: String = String(data: data, encoding: .utf8) {
        print(result)
    }
    
    
} catch GettingHTMLError.urlError {
    print("잘못된 URL입니다")
} catch GettingHTMLError.urlSeesionError {
    print("데이터를 가져오는 데 문제 발생")
} catch {
    print("알 수 없는 오류 발생")
}
