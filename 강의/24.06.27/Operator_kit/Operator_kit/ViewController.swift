//
//  ViewController.swift
//  Operator_kit
//
//  Created by 김종혁 on 6/27/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftField: UITextField!
    @IBOutlet weak var rightField: UITextField!
    @IBOutlet weak var sign: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftField.text = ""
        rightField.text = ""
        sign.text = ""
        resultLabel.text = "숫자를 입력하고, 비교를 누르시오"
    }

    
    @IBAction func compare(_ sender: Any) {
        let leftText: String = leftField.text ?? ""
        let rightText: String = rightField.text ?? ""
        
        let leftNumber: Int = Int(leftText) ?? 0
        let rightNumber: Int = Int(rightText) ?? 0
        
        
        if leftText > rightText {
            sign.text = ">"
            resultLabel.text = "왼쪽이 더 큼"
        } else if leftText < rightText {
            sign.text = "<"
            resultLabel.text = "오른쪽이 더 큼"
        } else {
            sign.text = "="
            resultLabel.text = "같음"
        }
    }
    
    @IBAction func plus(_ sender: Any) {
        calculator("+")
    }
    
    @IBAction func minus(_ sender: Any) {
        calculator("-")
    }
    
    @IBAction func mul(_ sender: Any) {
        calculator("*")
    }
    
    @IBAction func div(_ sender: Any) {
        calculator("/")
    }
    
    func calculator(_ str: String) {
        let leftText: String = leftField.text ?? ""
        let rightText: String = rightField.text ?? ""
        
        let leftNumber: Int = Int(leftText) ?? 0
        let rightNumber: Int = Int(rightText) ?? 0
        
        var resultNumber: Int = 0
        
        if str == "+" {
            resultNumber = leftNumber + rightNumber
        } else if str == "-" {
            resultNumber = leftNumber - rightNumber
        } else if str == "*" {
            resultNumber = leftNumber * rightNumber
        } else if str == "/" {
            if rightNumber == 0 {
                leftField.text = ""
                rightField.text = ""
                resultLabel.text = "INF"
                return
            } else {
                resultNumber = leftNumber / rightNumber
            }
        }
        
        resultLabel.text = String(resultNumber)
    }
    
}

