// 1. 화면을 기준으로 좌표(x,y)를 지정하고 싶으면 .global 좌표계를 사용
// 2. geometryReader 안쪽에서 geometryReader의 전체 사이즈를 기준으로 좌표를 지정하고 싶으면 .local 좌표계를 사용
// 3. geometryReader 안의 요소가 다른 뷰를 기준으로 좌표를 지정해야 한다면 custom 좌표계를 사용


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Geometry()
                .frame(width: 330, height: 330)
        }
        .coordinateSpace(name: "CustomCoordinate")
        .ignoresSafeArea()
        .background(.green)
    }
}

struct Geometry: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Text("Global centerX is: \(proxy.frame(in: .global).midX)")
                Text("Local centerX is: \(proxy.frame(in: .local).midX)")
                Text("Custom centerX is: \(proxy.frame(in: .named("CustomCoordinate")).midX)")
                
                Divider()
                
                Text("Global centerY is: \(proxy.frame(in: .global).midY)")
                Text("Local centerY is: \(proxy.frame(in: .local).midY)")
                Text("Custom centerY is: \(proxy.frame(in: .named("CustomCoordinate")).midY)")
            }
            .padding(.top, 80)
        }
        .background(.orange)
        .frame(width:300, height: 300)
    }
}

#Preview {
    ContentView()
}

