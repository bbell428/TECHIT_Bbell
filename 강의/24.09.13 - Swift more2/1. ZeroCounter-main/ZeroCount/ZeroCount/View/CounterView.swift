//
//  CounterView.swift
//  ZeroCount
//
//  Created by Jongwook Park on 2/5/24.
//

import SwiftUI

struct CounterView: View {
    private var countHistoryStore = CountHistoryStore()
    
    @AppStorage("ZeroCountValue") private var count: Int = 0
    
    @State private var showAlertReset: Bool = false
    @State private var showAlertSave: Bool = false
    
    private let fontSize: CGFloat = 250
    
    // MARK: -  0이 되면 Zero가 나오게 만들 연산프로퍼티 추가
    var countString: String {
        /*
        if count > 0 {
            return "\(count)"
        } else {
            return "ZERO"
        }
         */
        
        // swift 5.9 버전부터 가능한 방법
        /*
        let result = if count > 0 {
                        "\(count)"
                    } else {
                        "ZERO"
                    }
        
        return result
        */
        
        // 삼항식 사용
        count > 0 ? "\(count)" : "ZERO"
    }
    
    var body: some View {
        VStack {
            
            Button(action: {
                count += 1
                
                //MARK: - 햅틱 피드백으로 진동을 만들자!
                let generator: UIImpactFeedbackGenerator
                
                // 여기서는 10단위마다 진동을 강하게, 그 외엔 약하게 만들어준다
                if count % 10 == 0 {
                    generator = UIImpactFeedbackGenerator(style: .heavy)
                } else if count % 5 == 0 {
                    generator = UIImpactFeedbackGenerator(style: .medium)
                } else {
                    generator = UIImpactFeedbackGenerator(style: .soft)
                }
                
                generator.impactOccurred()
                
            }, label: {
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        
                        Text("\(countString)")
                            .font(.system(size: fontSize))
                            .fontWeight(.heavy)
                            .foregroundStyle(Color.count)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        
                        Spacer()
                    }
                    Spacer()
                }
            })
            .background(Color.accentColor)
            
            VStack {
                HStack {
                    Button(action: {
                        if count > 0 {
                            count -= 1
                        }
                    }, label: {
                        Text(String(localized: "Down"))
                            .padding()
                    })
                    
                    Text("|")
                        .padding()
                    
                    Button(action: {
                        showAlertReset.toggle()
                    }, label: {
                        Text(String(localized: "Reset"))
                            .padding()
                    })
                }
                
                Button(action: {
                    countHistoryStore.addData(count: count)
                    
                    showAlertSave.toggle()
                }, label: {
                    Label(String(localized: "Save current data"), systemImage: "square.and.arrow.down.fill")
                        .padding()
                })
            }
            .padding()
        }
        .alert(String(localized: "Will you reset?"), isPresented: $showAlertReset) {
            Button(role: .destructive) {
                count = 0
            } label: {
                Text(String(localized: "Reset"))
            }
        }
        .alert(String(localized: "Saving is completed"), isPresented: $showAlertSave, actions: { }, message: {
            Text(String(localized: "into history tab"))
        })
        .onAppear {
            // MARK: - 이 코드가 없으면 문제!!
            countHistoryStore.fetchData()
        }
    }
}

#Preview {
    CounterView()
}
