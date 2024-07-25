//
//  CounterView.swift
//  CounterMVVM
//
//  Created by Jongwook Park on 7/24/24.
//

import SwiftUI

struct CounterView: View {
    
    /*
     View는 ViewModel을 관찰해서
     변화가 생기면 body를 새로 그려주기 위해
     @ObservedObject 또는 @StateObject 프로퍼티 래퍼를
     ViewModel 앞에 붙여준다
     */
    @StateObject var viewModel: CounterViewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            /*
             ViewModel의 변화 알림에 반응해서
             새롭게 그려져야할 sub view들이 몇개가 되어도
             관련 코드를 더 추가할 일은 없다! (MVVM의 장점)
             */
            Text("\(viewModel.count)")
            Spacer()
            
            VStack {
                Button("plus1") {
                    viewModel.plus(number: 1)
                }.padding()

                
                Button("plus 10") {
                    viewModel.plus(number: 10)
                }.padding()
                
                Button("minus 1") {
                    viewModel.minus(number: 1)
                }.padding()

                Button("minus 10") {
                    viewModel.minus(number: 10)
                }
            }
                
            Spacer()
            Button("Reset") {
                viewModel.reset()
            }
        }
        .font(.largeTitle)
        .padding()
    }
}

#Preview {
    CounterView()
}
