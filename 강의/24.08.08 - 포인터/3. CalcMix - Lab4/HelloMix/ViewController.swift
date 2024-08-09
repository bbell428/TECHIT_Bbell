//
//  ViewController.swift
//  HelloMix
//
//  Created by Jongwook Park on 8/8/24.
//

import UIKit

class ViewController: UIViewController {
    let calc: MixCalc = MixCalc()
    var number1: Int = 0
    var number2: Int = 0
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextField.text = ""
        secondTextField.text = ""
    }
    
    @IBAction func plus(_ sender: Any) {
        TwoNumber()
        print(calc.plus(Int32(number1), with: Int32(number2)))
        result.text = String(calc.plus(Int32(number1), with: Int32(number2)))
    }
    
    @IBAction func minus(_ sender: Any) {
        TwoNumber()
        print(calc.minus(Int32(number1), with: Int32(number2)))
        result.text = String(calc.minus(Int32(number1), with: Int32(number2)))
    }
    
    @IBAction func divide(_ sender: Any) {
        TwoNumber()
        print(calc.divide(Int32(number1), with: Int32(number2)))
        result.text = String(calc.divide(Int32(number1), with: Int32(number2)))
    }
    
    @IBAction func multiply(_ sender: Any) {
        TwoNumber()
        print(calc.multiply(Int32(number1), with: Int32(number2)))
        result.text = String(calc.multiply(Int32(number1), with: Int32(number2)))
    }
    
    func TwoNumber() {
        number1 = Int(firstTextField.text ?? "") ?? 0
        number2 = Int(secondTextField.text ?? "") ?? 0
    }
    
}

