import SwiftUI
import Observation

// Binding과 Bindable

@Observable
class SearchEngine {
    var query: String = ""
}

struct BindableView: View {
    // Bindable 프로퍼티 래퍼로 ObservableObject를 처리하면
    // ObservableObject의 프로퍼티를 다른 뷰에
    // Biding($)으로 넘길 수 있게 된다
    @Bindable var searchEngine = SearchEngine()
    
    var body: some View {
        VStack {
            SearchView(query: $searchEngine.query)
            Text("Query: \(searchEngine.query)")
        }
        .padding()
    }
}

// Bindable 덕분에
// 이렇게 SearchEngine을 몰라도
// 다른 프로젝트에 이식 가능한(Portable) View를 만들 수 있다
struct SearchView: View {
    @Binding var query: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $query)
        }
    }
}
