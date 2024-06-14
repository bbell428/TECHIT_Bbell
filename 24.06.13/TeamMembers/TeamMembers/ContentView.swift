import SwiftUI

struct ContentView: View {
    
    let members: [String] = [
        "김효정",
        "김종혁",
        "김준환",
        "이소영",
        "홍재민"]
    
    @State var selectedMember: String = "조원"
    
    var body: some View {
        VStack {
            Text("\(selectedMember) 님, 안녕하세요!")
                .font(.largeTitle)
            
            List(members, id:\.self) { member in
                Section {
                    Button(action: {
                        selectedMember = member
                    }, label: {
                        HStack {
                            Spacer()
                            Text("\(member)")
                            Spacer()
                        }
                    })
                }.font(.largeTitle)
                
                /* HStack {
                    Spacer()
                    Button("\(member)") {
                        // 버튼이 눌리면 처리할 action

                        selectedMember = member
                    }.font(.largeTitle)
                    Spacer()
                } */
                
            }
            /*
            .listStyle(.plain)
            .listRowSeparator(.hidden)
             */
        }
    }
}

#Preview {
    ContentView()
}



/*
 import SwiftUI
import AVFoundation

struct ContentView: View {
    
    let members: [String] = [
        "김효정",
        "김종혁",
        "김준환",
        "이소영",
        "홍재민"]
    let speechSynth = AVSpeechSynthesizer()
    @State var selectedMember: String = "조원"
    @State var message: String = "안녕하세요"
    @State var speakMessage: String = "여러분 반갑습니다"
    var body: some View {
        VStack {
            Text("\(speakMessage)")
                .font(.largeTitle)
            
            List(members, id:\.self) { member in
                Section {
                    Button(action: {
                        selectedMember = member
                        speakMessage = "\(selectedMember)님, \(message)"
                        let utterance = AVSpeechUtterance(string: speakMessage)
                        speechSynth.speak(utterance)
                    }, label: {
                        HStack {
                            Spacer()
                            Text("\(member)")
                            Spacer()
                        }
                    })
                }.font(.largeTitle)
            }
            Button("Pause") {
                speechSynth.stopSpeaking(at:.word)
            }.font(.largeTitle)
            Spacer()
            /*
            .listStyle(.plain)
            .listRowSeparator(.hidden)
             */
        }
    }
}
 */
 */
