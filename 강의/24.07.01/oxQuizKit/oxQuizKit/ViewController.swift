//
//  ViewController.swift
//  oxQuizKit
//
//  Created by 김종혁 on 7/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var resultNumber: Int = 0 // 정답
    var resultBool: Int = 0
    
    var correct: Int = 0
    var inCorrect: Int = 0
    
    var count: Int = 0
    
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var resultNumberLabel: UILabel!
    
    @IBOutlet weak var countNumberLabel: UILabel!
    
    @IBOutlet weak var correctNumberLabel: UILabel!
    @IBOutlet weak var inCorrectNumberLabel: UILabel!
    
    @IBOutlet weak var scoreNumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        random()
    }
    
    @IBAction func oButton(_ sender: Any) {
        count += 1
        countNumberLabel.text = "\(count)번"
        print("\(resultNumber), \(resultBool)")
        if resultNumber == resultBool {
            correct += 1
            correctNumberLabel.text = "correct: \(correct)"
            scoreNumberLabel.text = "\(correct)/10"
        } else {
            inCorrect += 1
            inCorrectNumberLabel.text = "inCorrect: \(inCorrect)"
        }
        if count == 10 {
            scoreNumberLabel.text = "최종 점수: \(correct)/10"
        } else if count == 11 {
            correct = 0
            correctNumberLabel.text = "correct: \(correct)"
            inCorrect = 0
            inCorrectNumberLabel.text = "inCorrect: \(inCorrect)"
            count = 0
            countNumberLabel.text = "\(count+1)번"
            scoreNumberLabel.text = "\(correct)/10"
        }
        random()
    }
    
    @IBAction func xButton(_ sender: Any) {
        count += 1
        countNumberLabel.text = "\(count)번"
        if resultNumber != resultBool {
            correct += 1
            correctNumberLabel.text = "correct: \(correct)"
            scoreNumberLabel.text = "\(correct)/10"
        } else {
            inCorrect += 1
            inCorrectNumberLabel.text = "inCorrect: \(inCorrect)"
        }
        if count == 10 {
            scoreNumberLabel.text = "최종 점수: \(correct)/10"
        } else if count == 11 {
            correct = 0
            correctNumberLabel.text = "correct: \(correct)"
            inCorrect = 0
            inCorrectNumberLabel.text = "inCorrect: \(inCorrect)"
            count = 0
            countNumberLabel.text = "\(count)번"
            scoreNumberLabel.text = "\(correct)/10"
        }
        random()
    }
    
    
    func random() {
        firstNumber = Int.random(in: 2...9)
        secondNumber = Int.random(in: 1...9)
        firstNumberLabel.text = "\(firstNumber)"
        secondNumberLabel.text = "\(secondNumber)"
        
        resultNumber = firstNumber * secondNumber // 정답
        
        let firstNumber2: Int = Int.random(in: 2...9)
        let secondNumber2: Int = Int.random(in: 1...9)
        let resultNumber2: Int = firstNumber2 * secondNumber2 // 오답
        
        resultBool = Bool.random() ? resultNumber : resultNumber2
        resultNumberLabel.text = "\(resultBool)"
    }
    
    
}

