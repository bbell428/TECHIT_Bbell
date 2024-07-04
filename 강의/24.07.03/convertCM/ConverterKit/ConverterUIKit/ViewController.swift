//
//  ViewController.swift
//  ConverterUIKit
//
//  Created by 김동경 on 2024/07/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var convertTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func convertmmButton(_ sender: Any) {
        let convertfunc = { number in
            return number * 10
         }
        convertCmToMM(convert: convertfunc)
    }
    
    @IBAction func convertmButton(_ sender: Any) {
        
    }
    
    @IBAction func convertkmButton(_ sender: Any) {
        
    }
    
    
    
      
    func convertCmToMM(convert: (Int) -> Int) {
        let number = Int(convertTextField.text ?? "") ?? 0
        let result = convert(number)
        resultLabel.text = "\(result)"
    }
    
    
    
}

