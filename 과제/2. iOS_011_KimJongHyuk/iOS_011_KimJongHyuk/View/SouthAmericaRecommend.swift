//
//  AsiaSubView.swift
//  iOS_011_KimJongHyuk
//
//  Created by 김종혁 on 7/15/24.
//

import SwiftUI

struct SouthAmericaRecommend: View {
    @Binding var southAmerica: [TuristSouthAmerica] // 바인딩으로 데이터 받기
    
    @State private var randomsouthAmerica: TuristSouthAmerica? = nil
    
    @State private var addCountryField: String = ""
    @State private var addCityField: String = ""
    
    @State var isPresented: Bool = false
    @State var isPresentedText: String = ""
    
    @State var success = ""

    var body: some View {
        VStack {
            Text("\(success)")
            VStack {
                HStack {
                    Text("나라 입력:")
                    TextField("빈칸에 입력하세요", text: $addCountryField)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    
                }
                HStack {
                    Text("도시 입력:")
                    TextField("빈칸에 입력하세요", text: $addCityField)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                Button(action: {
                    addFunc()
                }, label: {
                    Text("나라에 도시 추가")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                .padding()
                .alert("\(isPresentedText)", isPresented: $isPresented) {
                    Button("OK") { }
                }
            }
            
            Divider()
                .padding()
            
            Button(action: {
                recommendFunc()
            }, label: {
                Text("추천하기")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            if let southAmerica = randomsouthAmerica {
                VStack(alignment: .leading) {
                    Text("나라: \(southAmerica.country)")
                    Text("도시: \(southAmerica.city.randomElement() ?? "")")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
            }
        }
        .padding()
    }

    func recommendFunc() {
        randomsouthAmerica = southAmerica.randomElement()
    }

    func addFunc() {
        var isCountryFound = false
        
        for index in 0..<southAmerica.count {
            if southAmerica[index].country == addCountryField {
                southAmerica[index].city.append(addCityField)
                isPresented = true
                isPresentedText = "나라 도시 추가 성공"
                addCountryField = ""
                addCityField = ""
                isCountryFound = true
                break
            }
        }
        if !isCountryFound {
            addCountryField = ""
            addCityField = ""
            isPresented = true
            isPresentedText = "나라 도시 추가 실패"
        }
    }
}
