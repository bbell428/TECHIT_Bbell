//
//  ContentView.swift
//  multipleChoiceQuestion
//
//  Created by 김종혁 on 7/26/24.
//

import SwiftUI

struct QuizChoiceView: View {
    @StateObject var questionScore: QuizChoiceViewModel = QuizChoiceViewModel()
    
    var body: some View {
        if let category = questionScore.category {
            VStack {
                // 점수
                Text("\(questionScore.currScore)")
                    .font(.largeTitle)
                
                Spacer()
                
                // 분야
                Text(category)
                    .padding()
                    .font(.title2)
                
                // 질문
                Text("\(questionScore.problem.question)")
                    .padding()
                
                // 보기 예시
                ForEach(questionScore.problem.choice.shuffled(), id: \.self) { choices in
                    Button(action: {
                        if choices == questionScore.problem.collect {
                            questionScore.collectScore()
                        }
                        questionScore.increaseProblem()
                    }, label: {
                        Text(choices)
                    })
                    .padding()
                    .font(.title3)
                }
                Spacer()
            }
        } else {
            Text("맞은 갯수: \(questionScore.currScore)")
                .font(.largeTitle)
                .padding()
            Button(action: {
                questionScore.reset()
            }, label: {
                Text("다시 시작")
                    .font(.largeTitle)
            })
        }
    }
}

#Preview {
    QuizChoiceView()
}
