// Binding과 Bindable

struct BindableView: View {
    @State private var query: String = ""
    
    var body: some View {
        VStack {
            SearchView(query: $query)
            Text("Query: \(query)")
        }
        .padding()
    }
}

struct SearchView: View {
    @Binding var query: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $query)
        }
    }
}
