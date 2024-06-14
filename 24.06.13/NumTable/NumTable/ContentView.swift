import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var selectedIndex: Int = 0
    @State var result: String = "(result)"
    
    let speechSynth = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Text("#Table")
                .padding()
            
            HStack {
                Spacer()
                ForEach(2 ..< 10) { item in
                    Button {
                        updateIndex(item)
                    } label: {
                        Text("\(item)")
                    }
                    Spacer()
                }
            }
            
            Spacer()
            
            if selectedIndex > 0 {
                Text("\(result)")
            }
            
            Spacer()
            
            HStack {
                Button("Say It!") {
                    let utterance = AVSpeechUtterance(string: result)
                    speechSynth.speak(utterance)
                }
                .padding()
                
                Button("Stop It!") {
                    speechSynth.stopSpeaking(at: .immediate)
                }
                .padding()
            }
        }
        .font(.largeTitle)
        .padding()
    }
    
    func updateIndex(_ index: Int) {
        print("\(index)")
        selectedIndex = index
        /*
        result = """
            \(selectedIndex) ✕ 1 = \(selectedIndex * 1)
            \(selectedIndex) ✕ 2 = \(selectedIndex * 2)
            \(selectedIndex) ✕ 3 = \(selectedIndex * 3)
            \(selectedIndex) ✕ 4 = \(selectedIndex * 4)
            \(selectedIndex) ✕ 5 = \(selectedIndex * 5)
            \(selectedIndex) ✕ 6 = \(selectedIndex * 6)
            \(selectedIndex) ✕ 7 = \(selectedIndex * 7)
            \(selectedIndex) ✕ 8 = \(selectedIndex * 8)
            \(selectedIndex) ✕ 9 = \(selectedIndex * 9)
            """
        */
        
        result = ""
        
        for temp in 1...9 {
            let calc: Int = selectedIndex * temp
            result += "\(selectedIndex) ✕ \(temp) = \(calc)\n"
        }
    }
}

#Preview {
    ContentView()
}
