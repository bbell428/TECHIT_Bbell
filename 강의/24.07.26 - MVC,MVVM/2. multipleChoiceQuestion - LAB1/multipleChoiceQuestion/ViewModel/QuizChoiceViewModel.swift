//
//  QuizChoiceViewModel.swift
//  multipleChoiceQuestion
//
//  Created by 김종혁 on 7/26/24.
//

import Foundation

class QuizChoiceViewModel: ObservableObject {
    @Published var score: Int = 0
    @Published var currProblem: Int = 0
    @Published var currCategory: Int = 0
    
    private let questions: [Category] = [
        Category(categoryName: "미술", question: [
            Question(question: "스페인 말라가에서 태어나 주로 프랑스에서 미술활동을 한 20세기의 대표적 큐비즘 화가는 누구인가?", choice: ["파블로 피카소", "디카프리오", "반 고흐", "파울로 피카소"], collect: "파블로 피카소"),
            Question(question: "별이 빛나는 밤을 그린 화가는 누구인가?", choice: ["반 고흐", "다빈치", "보티첼리", "달리"], collect: "반 고흐"),
            Question(question: "진주 귀고리를 한 소녀을 그린 화가는 누구인가?", choice: ["벨라스케스", "배르메르", "쇠라", "클림트"], collect: "베르메르")
        ]),
        
        Category(categoryName: "상식", question: [
            Question(question: "온도를 나타내는 단위에서 °C는 섭씨온도라고 읽는다. 그럼 °F는 뭐라고 읽을까?", choice: ["화씨온도", "절대온도", "랭킨온도", "에프온도"], collect: "화씨온도"),
            Question(question: "다음 중 동계올림픽의 종목이 아닌것은?", choice: ["스키점프", "트라이애슬론", "스켈레톤", "노르딕 복합"], collect: "트라이애슬론"),
            Question(question: "화가 바뀌어 오히려 복이 된다'라는 뜻의 사자성어는", choice: ["고진감래", "새옹지마", "전화위복", "희로애락"], collect: "노르딕 복합")
        ]),
        
        Category(categoryName: "스포츠", question: [
            Question(question: "손흥민이 현재 속해 있는 팀은?", choice: ["토트넘 홋스퍼", "AC 밀란", "애스턴 빌라", "아스날"], collect: "토트넘 홋스퍼"),
            Question(question: "로스앤젤레스 레이커스의 선수가 아닌 사람은?", choice: ["르브론 제임스", "타우린 프린스", "하치무라 루이", "하승진"], collect: "제이슨 테이텀")
        ]),
        
        Category(categoryName: "IT지식", question: [
            Question(question: "다음 중 컴파일 언어가 아닌것은?", choice: ["C언어", "Swift", "C#", "파이썬"], collect: "파이썬"),
            Question(question: "스위프트에서 이름이 없는 함수(익명 함수)는 뭐라고 할까?", choice: ["람다식", "클로저", "익명 함수", "메소드"], collect: "클로저"),
            Question(question: "다음 중 객체지향의 특징이 아닌것은?", choice: ["캡슐화", "추상화", "일급 함수", "다형성"], collect: "일급 함수")
        ])
    ]
    
    private var currQuestions: [Category]
    
    init() {
        currQuestions = questions.shuffled()
    }
    
    var currScore: Int {
        return score
    }
    
    var category: String? {
        get {
            if currQuestions.count <= currCategory {
                return nil
            } else {
                return currQuestions[currCategory].categoryName
            }
        }
    }
    
    var problem: Question {
        return currQuestions[currCategory].question[currProblem]
    }
    
    func increaseProblem() {
        currProblem += 1
        
        if currCategory < currQuestions.count && currQuestions[currCategory].question.count == currProblem {
            currProblem = 0
            currCategory += 1
        }
    }
    
    func collectScore() {
        score += 1
    }
    
    func reset() {
        score = 0
        currCategory = 0
        currProblem = 0
    }
}
