//
//  ViewController.swift
//  LottoKit
//
//  Created by 김동경 on 2024/07/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lottoLabel: UILabel!
    @IBOutlet weak var mylotto1: UILabel!
    @IBOutlet weak var mylotto2: UILabel!
    @IBOutlet weak var mylotto3: UILabel!
    @IBOutlet weak var mylotto4: UILabel!
    @IBOutlet weak var mylotto5: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func purchaseLottoButton(_ sender: Any) {
        let lottoLabels = [mylotto1, mylotto2, mylotto3, mylotto4, mylotto5]
        let prizeLotto = makeLotto()
        var bonusNumber:Int
        repeat {
            bonusNumber = Int.random(in: 1...45)
        }while prizeLotto.contains(bonusNumber)
        lottoLabel.text = "로또 : \(prizeLotto) + \(bonusNumber)"
        
        let myLotto = [makeLotto(),makeLotto(),makeLotto(),makeLotto(),makeLotto()]
        
        
        for (index, lotto) in myLotto.enumerated() {
            
            var count: Int = 0
            for number in lotto {
                if prizeLotto.contains(number) {
                    count += 1
                }
            }
            if count == 6 {
                lottoLabels[index]?.text = "1등 :\(lotto)"
            } else if count == 5{
                if lotto.contains(bonusNumber) {
                    lottoLabels[index]?.text = "2등 :\(lotto)"
                } else {
                    lottoLabels[index]?.text = "3등 :\(lotto)"
                }
            } else if count == 4 {
                lottoLabels[index]?.text = "4등 :\(lotto)"
            } else if count == 3 {
                lottoLabels[index]?.text = "5등 :\(lotto)"
            } else {
                lottoLabels[index]?.text = "꽝 :\(lotto)"
            }
            
        }
    }
    
    
    
    func makeLotto() -> [Int] {
        var lotto = Set<Int>()
        while lotto.count < 6 {
            lotto.insert(Int.random(in: 1...45))
        }
        return lotto.sorted()
    }
    
}

