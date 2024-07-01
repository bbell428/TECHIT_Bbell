import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var correctScore: UILabel!
    @IBOutlet weak var InCorrect: UILabel!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerButtonOne: UIButton!
    @IBOutlet weak var answerButtonTwo: UIButton!
    @IBOutlet weak var answerButtonThree: UIButton!
    
    var score: Int = 0
    var inscore: Int = 0
    
    var firstNumber: Int = Int.random(in: 2...9)
    var secondNumber: Int = Int.random(in: 1...9)
    
    var question: Int = 0
    
    func generateQuestion() {
        firstNumber = Int.random(in: 2...9)
        secondNumber = Int.random(in: 1...9)
        question = firstNumber * secondNumber
        questionLabel.text = "\(firstNumber) ✕ \(secondNumber)"
        
        var correctAnswers: [Int] = [
            question,
            Int.random(in: 0...81),
            Int.random(in: 0...81)
        ]
        
        correctAnswers.shuffle()
        
        answerButtonOne.setTitle("\(correctAnswers[0])", for: .normal)
        answerButtonTwo.setTitle("\(correctAnswers[1])", for: .normal)
        answerButtonThree.setTitle("\(correctAnswers[2])", for: .normal)
    }
    
    func checkAnswer(selectedAnswer: Int) {
        if selectedAnswer == question {
            score += 1
            correctScore.text = "Score: \(score)"
        } else {
            inscore += 1
            InCorrect.text = "inscore: \(inscore)"
        }
        generateQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctScore.text = "Correct: 0"
        InCorrect.text = "InCorrect: 0"
        generateQuestion()
    }
    
    @IBAction func answerNumberOne(_ sender: Any) {
        guard let answerText = answerButtonOne.title(for: .normal) else {
                return
            }
        guard let answer = Int(answerText) else {
            return
        }
        checkAnswer(selectedAnswer: answer)
        
    }
    
    @IBAction func answerNumberTwo(_ sender: Any) {
        guard let answerText = answerButtonTwo.title(for: .normal) else {
                return
            }
        guard let answer = Int(answerText) else {
            return
        }
        checkAnswer(selectedAnswer: answer)
        
    }
    
    @IBAction func answerNumberThree(_ sender: Any) {
        guard let answerText = answerButtonThree.title(for: .normal) else {
                return
            }
        guard let answer = Int(answerText) else {
            return
        }
            checkAnswer(selectedAnswer: answer)
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        score = 0
        inscore = 0
        correctScore.text = "Correct: \(score)"
        InCorrect.text = "InCorrect: \(inscore)"
        generateQuestion()
    }
}
