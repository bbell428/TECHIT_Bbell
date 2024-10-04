//
//  ChatView.swift
//  SyncDemo
//
//  Created by Jongwook Park on 3/5/24.
//

import SwiftUI
import FirebaseDatabase

let userImagesPaths: [String] = [
    "https://cdn.pixabay.com/photo/2017/02/01/11/19/cartoon-chips-2029737_1280.png",
    "https://cdn.pixabay.com/photo/2014/04/03/10/00/panda-309548_1280.png",
    "https://cdn.pixabay.com/photo/2014/10/04/22/29/monkey-474147_1280.png",
    "https://cdn.pixabay.com/photo/2013/07/13/13/42/tux-161406_1280.png",
    "https://cdn.pixabay.com/photo/2018/07/15/13/29/lamb-3539619_1280.png",
    "https://cdn.pixabay.com/photo/2017/08/15/15/44/frog-2644410_1280.png"
]

struct Message: Identifiable {
    var id: UUID = UUID()
    var userNumber: Int
    var message: String
    
    var userImageURL: URL {
        URL(string: userImagesPaths[userNumber])!
    }
}

let maxMessageCount: Int = 5

struct ChatView: View {
    @State private var messages: [Message] = [
//        Message(userNumber: 1, message: "Hello"),
//        Message(userNumber: 4, message: "Good morning"),
    ]
    @State private var userNumber: Int = 0
    @State private var postingMessage: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(messages) { message in
                    HStack {
                        AsyncImage(url: message.userImageURL) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Text("\(message.message)")
                    }
                }
            }
            .listStyle(.plain)
            
            Divider()
            
            HStack {
                // 배열의 내용을 하나씩 꺼낼 때,
                // 몇번째인지도 함께 알아낼 수 있는 방법
                ForEach(Array(userImagesPaths.enumerated()), id:\.offset) { index, path in
                    VStack {
                        Button {
                            userNumber = index
                            print(userNumber)
                        } label: {
                            AsyncImage(url: URL(string: path)!) { image in
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        
                        if userNumber == index {
                            Rectangle()
                                .fill(Color.accentColor)
                                .frame(width: 55, height: 5)
                        } else {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: 55, height: 5)
                        }
                    }
                }
            }
            
            HStack {
                TextField("New message", text: $postingMessage)
                
                if !postingMessage.isEmpty {
                    Button("Send") {
                        addMessage()
                    }
                }
            }
            .padding()
        }
        .onAppear {
            startWatchingDatabase()
        }
    }
    
    private func addMessage() {
        let message: Message = Message(userNumber: userNumber, message: postingMessage)
        messages.append(message)
        postingMessage = ""
        
        // 정해진 갯수만 유지하도록 만든다
        if messages.count > maxMessageCount {
            messages.removeFirst()
            
            // 배열의 처음과 끝 내용을 활용할 때는 First, Last를 적극적으로 사용하자
            /*
            messages.remove(at: 0)
            
            messages.removeLast()
            messages.remove(at: messages.count - 1)
            */
        }
        
        let dbRef = Database.database().reference().child("chat")
        
        // userNumber는 Int(Number)이고
        // messages는 String이기 때문에
        // 함께 담을 Dictionary는 Any타입을 활용했다
        var dbMessages:[[String: Any]] = []
        
        for data in messages {
            var dbData: [String: Any] = [:]
            dbData["userNumber"] = data.userNumber
            dbData["message"] = data.message
            dbMessages.append(dbData)
        }
        
        dbRef.setValue(dbMessages)
    }
    
    private func startWatchingDatabase() {
                
        let dbRef = Database.database().reference().child("chat")
        
        dbRef.observe(.value) { snapshot in
            
            messages.removeAll()
            
            if let dbHistory = snapshot.value as? [[String: Any]] {
                
                for data in dbHistory {
                    // Any타입의 값을 가져와 우리의 struct에 추가하려면
                    // 타입 변환이 필요하다
                    let userNumber: Int = data["userNumber"] as? Int ?? 0
                    let message: String = data["message"] as? String ?? ""
                    let data: Message = Message(userNumber: userNumber, message: message)
                    messages.append(data)
                }
            }
        }
    }
}

#Preview {
    ChatView()
}
