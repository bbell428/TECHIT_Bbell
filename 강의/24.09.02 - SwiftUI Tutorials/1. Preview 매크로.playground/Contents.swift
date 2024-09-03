// Preview를 매크로를 사용하지 않고
// 코드로 모두 작성하면
// 별도로 상수를 만들어 준비하고 대입하는 등의
// 커스텀 미리보기도 가능하다
struct ContentView_Previews: PreviewProvider {
    static let myName: String = "Ned"
    
    static var previews: some View {
        ContentView(name: myName)
    }
}
