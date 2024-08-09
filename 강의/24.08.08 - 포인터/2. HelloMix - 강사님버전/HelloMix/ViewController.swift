//
//  ViewController.swift
//  HelloMix
//
//  Created by Jongwook Park on 8/8/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MixCalc는 참조타입인 class로 선언됨
        // 그래서 let으로 만들어도 각종 명령과 내용 교체 가능
        let calc: MixCalc = MixCalc()
        
        let message: String = calc.greetingMessage()
        print("\(message)")
        
        let result: Int = Int(calc.addOne(102))
        print("\(result)")
    }


}

