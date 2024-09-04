import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<50) { index in
                    Text("Item \(index)")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
        }

        VStack {
            Spacer()
            Text("Hello, world!")
            Spacer()
            HelloView()
            HelloView()
            Spacer()
        }
    }
}


#Preview {
    ContentView()
}




//// MARK: 뷰는 원래 이렇게 생김
//// 연산 프로퍼티에서 많은 부분이 생략됨
//var body: some View {
//    get {
//        let stack = VStack(content: {
//            let text = Text("Hello, world!")
//            return text
//        })
//
//        return stack
//    }
//}


