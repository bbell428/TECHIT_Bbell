//
//  HappyData.swift
//  HappyAPI
//
//  Created by 김종혁 on 9/30/24.
//

import SwiftUI
import UIKit

// loadJson() 함수 호출로 초기화되는 Car 객체들의 배열을 참조하는 변수를 가진다
// JSON 파일을 로드하는 표준 방식
func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
