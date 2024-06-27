//
//  ViewController.swift
//  CalcKit
//
//  Created by Jongwook Park on 6/7/24.
//

import UIKit

class ViewController: UIViewController {
    
    var number1: Int = 0
    var number2: Int = 0
    var result: Int = 0
    
    @IBOutlet weak var labelNumber1: UILabel!
    @IBOutlet weak var labelNumber2: UILabel!
    
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelNumber1.text = "\(number1)"
        labelNumber2.text = "\(number2)"
        labelResult.text = "Result"
    }

    @IBAction func minusNumber1(_ sender: Any) {
        number1 = number1 - 1
        labelNumber1.text = "\(number1)"
    }
    
    @IBAction func plusNumber1(_ sender: Any) {
        number1 = number1 + 1
        labelNumber1.text = "\(number1)"
    }
    
    @IBAction func minusNumber2(_ sender: Any) {
        number2 = number2 - 1
        labelNumber2.text = "\(number2)"
    }
    
    @IBAction func plusNumber2(_ sender: Any) {
        number2 = number2 + 1
        labelNumber2.text = "\(number2)"
    }
    
    @IBAction func minus(_ sender: Any) {
        result = number1 - number2
        labelResult.text = "\(result)"
    }
    
    @IBAction func plus(_ sender: Any) {
        result = number1 + number2
        labelResult.text = "\(result)"
    }
    
    @IBAction func mul(_ sender: Any) {
        result = number1 * number2
        labelResult.text = "\(result)"
    }
    
    @IBAction func div(_ sender: Any) {
        if(number2 == 0) {
            labelResult.text = "Nan"
        } else {
            result = number1 / number2
            labelResult.text = "\(result)"
        }
        
    }
    @IBAction func reset(_ sender: Any) {
        number1 = 0
        number2 = 0
        result = 0
        labelNumber1.text = "\(number1)"
        labelNumber2.text = "\(number2)"
        labelResult.text = "\(result)"
    }
}

