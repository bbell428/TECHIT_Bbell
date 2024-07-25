//
//  ViewController.swift
//  RealCalculatorMVC
//
//  Created by 홍재민 on 7/24/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var calcModel: CalcModel = CalcModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAllCalUIs()
    }
    
    @IBAction func increaseNumber(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        if button.tag == 200 {
            calcModel.increaseFirstNumber()
            updateFirstNumberLabel()
        } else if button.tag == 201 {
            calcModel.increaseSecondNumber()
            updateSecondNumberLabel()
        }
    }
    
    @IBAction func decreaseNumber(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        if button.tag == 202 {
            calcModel.decreaseFirstNumber()
            updateFirstNumberLabel()
        } else if button.tag == 203 {
            calcModel.decreaseSecondNumber()
            updateSecondNumberLabel()
        }
    }
    
    @IBAction func onPressAddButton(_ sender: Any) {
        calcModel.add()
        updateResultLabel()
    }
    
    @IBAction func onPressMinusButton(_ sender: Any) {
        calcModel.minus()
        updateResultLabel()
    }
    
    @IBAction func onPressMultiplyButton(_ sender: Any) {
        calcModel.multifly()
        updateResultLabel()
    }
    
    @IBAction func onPressDivideButton(_ sender: Any) {
        calcModel.divide()
        updateResultLabel()
        updateRemainLabel()
    }
    
    @IBAction func onPressResetButton(_ sender: Any) {
        calcModel.resetAll()
        updateAllCalUIs()
    }
    
    private func updateAllCalUIs() {
        updateResultLabel()
        updateRemainLabel()
        updateFirstNumberLabel()
        updateSecondNumberLabel()
    }

    private func updateResultLabel() {
        guard let label = getView(tag: 100) as? UILabel else { return }
        
        label.text = calcModel.result
    }
    
    private func updateRemainLabel() {
        guard let label = getView(tag: 101) as? UILabel else { return }
        
        label.text = "\(calcModel.remain)"
    }
    
    private func updateFirstNumberLabel() {
        guard let label = getView(tag: 102) as? UILabel else { return }
        
        label.text = "\(calcModel.firstNumber)"
    }
    
    private func updateSecondNumberLabel() {
        guard let label = getView(tag: 103) as? UILabel else { return }
        
        label.text = "\(calcModel.secondNumber)"
    }
    
    private func getView(tag: Int) -> UIView? {
        return view.viewWithTag(tag)
    }
}

