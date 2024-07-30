//
//  FavoritesViewController.swift
//  CalcKVO
//
//  Created by 김종혁 on 7/29/24.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var model: CalcModel = CalcModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // KVO 관찰자 추가
        setupObserver()
        
        displayStatusNum()
    }
    
    @IBAction func upDownNumber(_ sender: Any) {
        // sender는 버튼 같은 UI 요소를 클릭할 때, 어떤 버튼이 클릭되었는지를 알려주는 역할을 합니다.
        guard let button = sender as? UIButton else {
            print("button은 UIButton 타입으로 변환 불가!")
            return
        }
        
        switch button.tag {
        case 201:
            model.increaseFirstNumber()
            NumberModel.shared.number1 = model.firstNumber
        case 202:
            model.decreaseFirstNumber()
            NumberModel.shared.number1 = model.firstNumber
        case 203:
            model.increaseSecondNumber()
            NumberModel.shared.number2 = model.secondNumber
        case 204:
            model.decreaseSecondNumber()
            NumberModel.shared.number2 = model.secondNumber
        default:
            break
        }
        displayStatusNum()
    }
    
    
    // KVO를 활용한다면 deinit 메서드에 반드시
    // 해당 항목의 관찰을 그만 두겠다는 코드를 추가할 필요가 있다
    deinit {
        NumberModel.shared.removeObserver(self, forKeyPath: #keyPath(NumberModel.number1))
        NumberModel.shared.removeObserver(self, forKeyPath: #keyPath(NumberModel.number2))
    }
    
    
    func setupObserver() {
        // 만약 LoginModel에서 제공하는 shared 인스턴스에 관찰자를 추가하는 코드
        // LoginModel 안의 name이라는 프로퍼티까지의 찾아가는 데이터 포함 경로를 지정하고
        // 신규값이 생기거나(.new), 최초로 값이 할당되거든(.initial)
        // 알림을 받을 준비를 하게 만든다
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
    }
    
}
