import SwiftUI
import Observation // iOS 17부터 가능

struct HelloModel {
    var name: String = "Tuna"
}

@Observable // iOS 17부터 가능한 매크로
class HelloViewModel {
    var model: HelloModel = HelloModel()
    
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
    private var viewModel: HelloViewModel = HelloViewModel()
    
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
