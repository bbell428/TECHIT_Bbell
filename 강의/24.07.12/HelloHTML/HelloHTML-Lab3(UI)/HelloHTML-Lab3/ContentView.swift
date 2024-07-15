//
//  ContentView.swift
//  HelloHTML-Lab3
//
//  Created by 김종혁 on 7/12/24.
//

import SwiftUI

enum GettingHTMLError: Error {
    case urlError
    case urlSeesionError
}

struct ContentView: View {
    
    @State var reusltTextView: String = ""
    @State var dict: [String : String] = [
        "종혁님": "https://github.com/bbell428?tab=repositories",
        "동경님": "https://github.com/dongykung",
        "정원님": "https://github.com/gadisom",
        "정민님": "https://github.com/Jeolmi123"
    ]
    
    var body: some View {
        VStack {
            ForEach (dict.sorted(by: <), id: \.key) { key, value in
                Button(action: {
                    Task {
                        do {
                            let data: Data = try await requestHTML(from: value)
                            
                            if let result: String = String(data: data, encoding: .utf8) {
                                reusltTextView = result
                                print(reusltTextView)
                            }
                            
                        } catch GettingHTMLError.urlError {
                            reusltTextView = "잘못된 URL입니다"
                        } catch GettingHTMLError.urlSeesionError {
                            reusltTextView = "데이터를 가져오는 데 문제 발생"
                        } catch {
                            reusltTextView = "알 수 없는 오류 발생"
                        }
                    }
                }, label: {
                    Text("\(key)")
                })
            }
            TextEditor(text: $reusltTextView)
        }
        .padding()
    }
    
    func requestHTML(from urlString: String) async throws -> Data {
        // url이 정상적으로 만들어지는가?
        guard let url = URL(string: urlString) else {
            throw GettingHTMLError.urlError
        }
        
        // url에서 데이터 가져오기...
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            return data
        } catch {
            throw GettingHTMLError.urlSeesionError
        }
    }
    
}

#Preview {
    ContentView()
}
