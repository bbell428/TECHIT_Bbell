import SwiftUI

struct ContentView: View {
    @AppStorage("Count") private var count: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(count)")
                .font(.system(size: 150))
            
            Spacer()
            
            Button("Plus One") {
                count += 1
            }
            .font(.largeTitle)
        }
        .padding()
    }
}
