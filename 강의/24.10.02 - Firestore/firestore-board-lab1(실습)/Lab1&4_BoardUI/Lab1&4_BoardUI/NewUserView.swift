
import SwiftUI

struct NewUserView: View {
    @AppStorage("nickName") var nickName : String = ""
    @AppStorage("firstLaunch") var isFirstLaunch: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("사용자 이름을 입력하세요")
                    .font(.largeTitle)
                
                Spacer()
                
                TextField(text: $nickName) {
                    Text("이름을 입력해주세요")
                }
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray, lineWidth: 1.5)
                }
                
                Spacer()
                
                NavigationLink(destination: MainBoardList()) {
                    Text("시작하기")
                        .frame(width: 300, height: 50)
                        .foregroundStyle(.black)
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .disabled(nickName.isEmpty)
                .simultaneousGesture(TapGesture().onEnded {
                                    isFirstLaunch = true
                                })
                
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    NewUserView()
}

