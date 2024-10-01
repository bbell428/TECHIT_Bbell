//
//  CountryStore.swift
//  CounrtryAPI
//
//  Created by 김종혁 on 9/30/24.
//

import SwiftUI
import Combine
import Observation

@Observable
class CountryStore {
    var countrys: [Country]
    
    init(countrys: [Country] = []) {
        self.countrys = countrys
    }
    
    // 다음의 주소에서 JSON 파일을 읽어서 Car 타입의 배열로 디코딩하는 메서드
    // https://run.mocky.io/v3/61467735-baf5-4863-a270-81a450b67eb9
    func fetchData() async {
        let urlString: String = "https://minyoungyoo.com/api/getCountries"
        
        if let url = URL(string: urlString) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                let countrys = try decoder.decode([Country].self, from: data)
                self.countrys = countrys
            } catch {
                print("error")
            }
        }
    }
}
