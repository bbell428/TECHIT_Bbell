//
//  HelloView.swift
//  HelloDemo
//
//  Created by Jongwook Park on 9/3/24.
//

import SwiftUI
import Observation
import SafariServices

struct Service: Identifiable {
    var id = UUID()
    var name: String
    var urlString: String
}

@Observable
class ServiceStore {
    var services: [Service] = []
    
    init() {
        #if DEBUG
        services = [
            Service(name: "KBS", urlString: "https://www.kbs.co.kr"),
            Service(name: "MBC", urlString: "http://imbc.com"),
            Service(name: "SBS", urlString: "http://sbs.co.kr"),
        ]
        #endif
    }
}

struct HelloView: View {
    var serviceStore = ServiceStore()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(serviceStore.services) { service in
                    NavigationLink(service.name) {
                        SafariView(address: service.urlString)
                            .navigationTitle(service.name)
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
                .navigationTitle("Services")
            }
        }
    }
}

// UIViewController를 View처럼 가져와 사용하려면
// UIViewControllerRepresentable 프로토콜을 따라야한다
struct SafariView: UIViewControllerRepresentable {
    var address: String
    
    // 어떤 UIViewController 계열을 가져와서 SwiftUI의 View로 만들지 결정
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let url = URL(string: address)!
        let viewController = SFSafariViewController(url: url)
        
        return viewController
    }
    
    // 화면에 업데이트 상황이 발생하면 대응해줄 코드
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // 현재는 따로 해줄 일이 없음
    }
    
}


#Preview {
    HelloView()
}
