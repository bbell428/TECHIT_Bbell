import SwiftUI

struct ContentView: View {
    
    @State var count: Int = 0
    @State var color: Color = .red
    
    var body: some View {
        VStack {
            
            ColorPicker("Color", selection: $color)
            Text("\(count)")
                .foregroundColor(color)
            
            HStack{
                Button("+1") {
                    calculator("+", 1)
                }
                .padding()
                
                Button("+5") {
                    calculator("+", 5)
                }
                .padding()
                
                Button("+10") {
                    calculator("+", 10)
                }
                .padding()
                
                Button("-1") {
                    calculator("-", 1)
                }
                .padding()
            }
            Spacer()
            
            Button("reset") {
                calculator("*", 0)
            }
            .foregroundColor(color)
        }
        .font(.largeTitle)
        .padding()
    }
    
    func calculator(_ str: String, _ num:Int) {
        if str == "+" {
            count = count + num
        } else if str == "-" {
            count = count - num
            if count <= 0 {
                count = 0
            }
        } else {
            count = 0
        }
    }
}
#Preview {
    ContentView()
}
