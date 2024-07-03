//
//  ContentView.swift
//  country
//
//  Created by 김수민 on 7/2/24.
//



import SwiftUI

let members : [String :  String] = [
    "김수민" : "🇪🇸",
    "김동경" : "🇹🇭",
    "김종혁" : "🇱🇺",
    "홍지수" : "🇧🇷",
    "홍재민" : "🇺🇸",
    "김원호" : "🇨🇳",
    "이주노" : "🇫🇮",
    "박준영" : "🇩🇪",
    "김승철" : "🇳🇿",
    "이다영" : "🇯🇵",
    "이소영" : "🇲🇳",
    "현초" : "🇸🇪",
    "구영진" : "🇲🇻",
    "강희창" : "🇦🇷",
    "김수은" : "🇨🇭",
    "황인영" : "🇹🇼"
]

func greetingCountry(_ country : String) -> String{
    switch country{
        case "🇪🇸"
            : return "Hola !"
        case "🇹🇭"
            : return "싸와디캅 !"
        case "🇱🇺"
            : return "Moien!"
        case "🇧🇷"
            : return "olá !"
        case "🇺🇸"
            : return  "hi !"
        case "🇨🇳"
            : return "你好 !"
        case "🇩🇪"
            : return "Guten Tag !"
        case "🇫🇮"
                : return "Moi !"
        case "🇳🇿"
            : return  "hello !"
        case "🇯🇵"
            : return  "こんにちは !"
        case "🇲🇳"
            : return  "Сайн байна уу !"
        case "🇸🇪"
            : return  "Hej !"
        case "🇲🇻"
            : return  "Dhivehin Jeha !"
        case "🇦🇷"
            : return  "Hola !"
        case "🇨🇭"
            : return  "Bonjour !"
        case "🇹🇼"
            : return  "Nihao !"
        default
            : return "-no country-"

    }
}

struct ContentView: View {
    @State var selectedMember = ""
    var body: some View {
        VStack {
            Text("Choose Member")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            List {
                ForEach(members.keys.sorted(), id: \.self) { name in
                    Button(action: {
                        selectedMember = name
                    }, label: {
                        Text("\(name)")
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.mint)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .font(.title)
                    .fontWeight(.semibold)
                }.listRowBackground(Color.clear)
            } .cornerRadius(80)
            
            if let country = members[selectedMember] {
                VStack {
                    Text("\(selectedMember)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("\(country)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("\(greetingCountry(country))")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }
        }
        .padding()
        .background(Color.white)
    }
}

#Preview {
    ContentView()
}
