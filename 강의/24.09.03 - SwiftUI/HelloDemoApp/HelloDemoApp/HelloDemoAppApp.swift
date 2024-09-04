import SwiftUI

@main
struct HelloDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    // 위 코드는 아래와 같은 코드에서 많은 부분이 생략된 것이다
    /*
    var body: some Scene {
        return WindowGroup(content: {
            return ContentView()
        })
    }
     */
}
