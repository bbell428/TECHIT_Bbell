import SwiftUI

struct ContentView: View {
    
    // State라는 프로퍼티 래퍼는
    // number의 값이 변경이 될 때
    // 프로퍼티 래퍼의 연산 프로퍼티의
    // set 코드에 지정된 내용에 따라
    // body를 새로 그린다
    @State var number: Int = 0
    
    // AppStorage 프로퍼티 래퍼는
    // State와 동일한 동작을 하지만
    // 연산프로퍼티의 set 코드에서
    // UserDefaults라는 공간에
    // 해당 내용을 계속 저장되어
    // 다음번에 새로 앱을 시작하면
    // 해당 내용을 꺼내 바로 보여주게 해준다
    @AppStorage("myNumber") var savedNumber: Int = 0
    
    var body: some View {
        VStack {
            VStack {
                Text("@State")
                Text("\(number)")
                    .padding()
                
                Button(action: {
                    number += 1
                }, label: {
                    Text("+1")
                        .padding()
                })
            }
            .font(.largeTitle)
            .padding()
            
            Divider()
            
            VStack {
                Text("@AppStorage")
                Text("\(savedNumber)")
                    .padding()
                
                Button(action: {
                    savedNumber += 1
                }, label: {
                    Text("+1")
                        .padding()
                })
            }
            .font(.largeTitle)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
