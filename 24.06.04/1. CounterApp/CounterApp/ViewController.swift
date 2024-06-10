//
//  ViewController.swift
//  CounterApp
//
//  Created by 김종혁 on 6/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    // 나타날 숫자를 담을 그릇을 만들어 봅시다.
    var number: Int = 0
    
    // 숫자가 나타날 라벨에 코드가 인식할 이름을 붙여봅시다!
    @IBOutlet weak var numberLabel: UILabel!
    
    // 처음 앱이 시작되면 처리할 코드를 여기 담아봅시다.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 숫자를 문자로 바꾸어 화면에 나타내려면
        // 이런 방법을 사용합니다.
        numberLabel.text = "\(number)"
    
    }
    
    @IBAction func plusOne(_ sender: Any) {
        // "Plus One" 버튼이 눌렀을 때 작동될 코드
        print("Hello World")
        
        // 기존 number에 1을 더한 값을
        // 새롭게 number의 값으로 삼는다.
        number = number + 1
        
        // 바뀐 number 값을 화면에 보여줍시다.
        numberLabel.text = "\(number)"
    }
    
}

