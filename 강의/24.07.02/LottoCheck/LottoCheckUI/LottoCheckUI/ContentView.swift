import SwiftUI

struct ContentView: View {
    
    @State var bonus: Int = 0
    @State var prizeLotto: [Int] = []
    @State var userLotto: [[Int]] = []
    @State var resultLotto: [String] = []
    
    var body: some View {
        VStack {
            Text("당첨 복권")
            Text("\(prizeLotto)")
            Text("보너스: \(bonus)")
                .padding()
            Spacer()
            
            Text("사용자 복권 결과")
            VStack(alignment: .leading) {
                
                ForEach(resultLotto, id: \.self) { result in
                    Text(result)
                        .padding()
                }
            }
            Spacer()
        }
        .font(.system(size: 25))
        .onAppear {
            prizeLotto = makeLotto() // 당첨 번호 생성
            checkResults() // 결과 체크
        }
        .padding(.top, 30)
        
        Button(action: {
            drawLotto()
        }, label: {
            Text("로또 다시 돌리기")
        })
        .onAppear {
            drawLotto()
        }
    }
    
    func makeLotto() -> [Int] {
        var randomLotto = Set<Int>()
        
        repeat {
            randomLotto.insert(Int.random(in: 1...45))
        } while randomLotto.count < 6
        
        repeat {
            bonus = Int.random(in: 1...45)
        } while randomLotto.contains(bonus)
        
        return randomLotto.sorted()
    }
    
    func checkResults() {
        var results: [String] = []
        
        userLotto = [
            makeLotto(),
            makeLotto(),
            makeLotto(),
            makeLotto(),
            makeLotto()
        ] // 구매 복권
        
        for Lotto in userLotto {
            var count: Int = 0
            
            for number in Lotto {
                if prizeLotto.contains(number) {
                    count += 1
                }
            }
            if count == 6 {
                results.append("1등: \(Lotto)")
            } else if count == 5 {
                if Lotto.contains(bonus) {
                    results.append("2등: \(Lotto)")
                } else {
                    results.append("3등: \(Lotto)")
                }
            } else if count == 4 {
                results.append("4등: \(Lotto)")
            } else if count == 3 {
                results.append("5등: \(Lotto)")
            } else {
                results.append("꽝: \(Lotto)")
            }
        }
        resultLotto = results
    }
    
    func drawLotto() {
            prizeLotto = makeLotto() // 당첨 번호 생성
            checkResults() // 결과 체크
        }
}

#Preview {
    ContentView()
}
