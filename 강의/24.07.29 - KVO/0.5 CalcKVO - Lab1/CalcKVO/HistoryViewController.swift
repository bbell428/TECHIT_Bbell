//
//  ViewController.swift
//  CalcKVO
//
//  Created by 김종혁 on 7/29/24.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var model: CalcModel = CalcModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // KVO 관찰자 추가
        setupObserver()
    }
    
    deinit {
        NumberModel.shared.removeObserver(self, forKeyPath: #keyPath(NumberModel.number1))
        NumberModel.shared.removeObserver(self, forKeyPath: #keyPath(NumberModel.number2))
    }
    
    func setupObserver() {
        NumberModel.shared.addObserver(self, forKeyPath: #keyPath(NumberModel.number1), options: [.new, .initial], context: nil)
        NumberModel.shared.addObserver(self, forKeyPath: #keyPath(NumberModel.number2), options: [.new, .initial], context: nil)
    }
    
    // 관찰자에서 이벤트가 발행하면 처리해줄 코드
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        // 우리가 관찰하려는 keyPath의 값이 바뀌었다면 처리할 코드
        if keyPath == #keyPath(NumberModel.number1) {
            displayStatusNum()
        } else if keyPath == #keyPath(NumberModel.number2) {
            displayStatusNum()
        }
    }
    
    // 태그 라벨
    func displayStatusNum() {
        if let label = view.viewWithTag(101) as? UILabel {
            label.text = "\(NumberModel.shared.number1)"
        }
        
        if let label = view.viewWithTag(102) as? UILabel {
            label.text = "\(NumberModel.shared.number2)"
        }
        
        let addReSult = "\(NumberModel.shared.number1 + NumberModel.shared.number2)"
        if let label = view.viewWithTag(103) as? UILabel {
            label.text = addReSult
        }
    }
}

