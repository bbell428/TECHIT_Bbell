import SwiftUI

struct ContentView: View {
    @AppStorage("tabIndex") var tabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $tabIndex) {
            NavigationStack {
                 Asia(asia: asia)
            }
            .tabItem {
                Label("Asia", systemImage: "globe")
            }
            .tag(0)
            .background(Color.blue) // 배경색 설정
            
            NavigationStack {
                Europe(europe: europe)
            }
            .tabItem {
                Label("Europe", systemImage: "globe")
            }
            .tag(1)
            .background(Color.green) // 배경색 설정
            
            NavigationStack {
                NorthAmerica(northAmerica: northAmerica)
            }
            .tabItem {
                Label("North America", systemImage: "globe")
            }
            .tag(2)
            .background(Color.red) // 배경색 설정
            
            NavigationStack {
                SouthAmerica(southAmerica: southAmerica)
            }
            .tabItem {
                Label("South America", systemImage: "globe")
            }
            .tag(3)
            .background(Color.orange) // 배경색 설정
            
            NavigationStack {
                Oceania(oceania: oceania)
            }
            .tabItem {
                Label("Oceania", systemImage: "globe")
            }
            .tag(4)
            .background(Color.purple) // 배경색 설정
        }
        .accentColor(.blue) // 탭 아이템의 색상 설정
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
