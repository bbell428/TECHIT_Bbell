//
//  ViewController.swift
//  NewCounterApp
//
//  Created by 김종혁 on 6/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "\(number)"
    }
    
    @IBAction func minusOne(_ sender: Any) {
        minus()
    }
    @IBAction func plusOne(_ sender: Any) {
        plus(1)
    }
    @IBAction func plusFive(_ sender: Any) {
        plus(5)
    }
    @IBAction func plusTen(_ sender: Any) {
        plus(10)
    }
    @IBAction func resetButton(_ sender: Any) {
        plus(0)
    }
    
    func plus(_ count : Int){
        number += count
        
        if count == 0 {
            number = 0
        }
        numberLabel.text = "\(number)"
    }
    
    func minus(){
        if number > 0 {
            number -=  1
        } else {
            number = 0
        }
        numberLabel.text = "\(number)"
    }
    
}
