// 가장 기본적인 MVVM 패턴에 맞춘 SwiftUI 예제

import SwiftUI

struct HelloModel {
    var name: String = "Tuna"
}

class HelloViewModel: ObservableObject {
    @Published var model: HelloModel = HelloModel()
    
    var name: String {
        get {
            return model.name
        }
        set {
            model.name = newValue
        }
    }
}

struct HelloView: View {
    @StateObject private var viewModel: HelloViewModel = HelloViewModel()
    
    var body: some View {
        VStack {
            Text("Hello \(viewModel.name)")
                .padding()
            
            Button("Change name") {
                viewModel.name = "Ned"
            }
        }
        .font(.largeTitle)
        .padding()
    }
}
