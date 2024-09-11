import SwiftUI
import Observation

@Observable
class Counter {
    private let countKey = "Count"
    
    var count: Int
    
    init() {
        // 처음 시작할 때 UserDefaults에서 값을 가져와 반영하자
        let dafaults = UserDefaults.standard
        count = dafaults.object(forKey: countKey) as? Int ?? 0
    }
    
    func increase() {
        count += 1
        
        // 숫자가 바뀌면 UserDefaults에서 값을 저장하자
        let dafaults = UserDefaults.standard
        dafaults.set(count, forKey: countKey)
    }
}

struct ContentView: View {
    private var counter = Counter()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(counter.count)")
                .font(.system(size: 150))
            
            Spacer()
            
            Button("Plus One") {
                counter.increase()
            }
            .font(.largeTitle)
        }
        .padding()
    }
}
