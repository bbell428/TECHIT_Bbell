//
//  HappyStore.swift
//  HappyAPI
//
//  Created by 김종혁 on 9/30/24.
//


import SwiftUI
import Observation

@Observable
class HappyStore {
    var happys: Happy = Happy(message: "123", statusCode: 12, data: DataClass(id: 123, content: "", author: "", description: "", link: ""))
    
    init() {
        Task {
            await fetchData()
        }
    }
    
    // 다음의 주소에서 JSON 파일을 읽어서 Car 타입의 배열로 디코딩하는 메서드
    // https://run.mocky.io/v3/61467735-baf5-4863-a270-81a450b67eb9
    func fetchData() async {
        let urlString: String = "https://api.sobabear.com/happiness/random-quote"
        
        if let url = URL(string: urlString) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                let happys = try decoder.decode(Happy.self, from: data)
                self.happys = happys
            } catch {
                print("error")
            }
        }
    }
}
