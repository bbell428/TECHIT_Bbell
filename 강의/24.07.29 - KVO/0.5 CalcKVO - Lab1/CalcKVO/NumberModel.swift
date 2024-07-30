//
//  NumberModel.swift
//  CalcKVO
//
//  Created by 김종혁 on 7/29/24.
//

import Foundation

// KVO에 맞춰 진행하려면, Swift가 아닌
// Objective-C에서 말하는 기본 클래스인 NSObject를 상속받아야할 수 있다.
class NumberModel: NSObject {
    // Singleton 패턴을 적용하기 위해
    // shared라는 타입 인스턴스를 만들어주자
    static let shared: NumberModel = NumberModel()
    
    // KVO로 관찰당하고자 하는 대상에 @objc dynamic 키워드를 추가한다
    // @objc는 Objective-C를 위한 런타임이 이해하도록 돕는 키워드
    @objc dynamic var number1: Int = 0
    @objc dynamic var number2: Int = 0
}

struct CalcModel {
    /*
     set(값을 할당하는 작업)은 private으로 설정해서
     이 타입의 내부 메서드를 통해서만 가능하게 만든다
     : Controller는 Model의 메서드를 통해서,
     : Model 내부의 값을 간접적으로 수정할 수 있다.
     */
    private(set) var firstNumber: Int = 0
    private(set) var secondNumber: Int = 0
    
    /*
     result의 타입을 무엇으로 하면 좋을까?
     Int: 5/2의 결과에서 수숫점 이하를 보여줄 수 없다
     Double: 103/0의 결과가 "이런거 안됨"표시할 때 애매하다
     그래서 결론은 String으로 처리하자!
     */
    // mutating 키워드는 구조체(struct)와 열거형(enum) 내에서 메서드가 인스턴스의 프로퍼티를 변경할 수 있도록 하는 데 사용됩니다.
    mutating func increaseFirstNumber() {
        firstNumber += 1
    }
    
    mutating func decreaseFirstNumber() {
        firstNumber -= 1
    }
    
    mutating func increaseSecondNumber() {
        secondNumber += 1
    }
    
    mutating func decreaseSecondNumber() {
        secondNumber -= 1
    }
    
//    mutating func add() {
//        result = "\(firstNumber + secondNumber)"
//    }
}
