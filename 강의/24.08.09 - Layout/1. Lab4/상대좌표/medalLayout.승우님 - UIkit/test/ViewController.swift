//
//  ViewController.swift
//  test
//
//  Created by 강승우 on 2024/08/09.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data: [[String: String]] = [
            [
                "name": "USA",
                "medals": "30",
                "flag": "🇺🇸"
            ],
            [
                "name": "CHN",
                "medals": "29",
                "flag": "🇨🇳"
            ],
            [
                "name": "AUS",
                "medals": "18",
                "flag": "🇦🇺"
            ],
            [
                "name": "FRA",
                "medals": "14",
                "flag": "🇫🇷"
            ],
            [
                "name": "GBR",
                "medals": "13",
                "flag": "🇬🇧"
            ],
            [
                "name": "KOR",
                "medals": "13",
                "flag": "🇰🇷"
            ],
        ]
        
        // 다음의 코드를 이용해서 절대좌표로 만들어주세요
        
        let myView: UIView = UIView()
        myView.frame = CGRect(x: 20, y: 100, width: 360, height: 500)
        myView.backgroundColor = UIColor.white
        myView.layer.borderWidth = 1.0
        myView.layer.borderColor = UIColor.black.cgColor
        // ViewController가 가진 view 프로퍼티에 서브뷰로 추가해야 화면에 보입니다
        view.addSubview(myView)
        var index : Int = 0
        for info in data {
            let myLabel: UILabel = UILabel()
            myLabel.frame = CGRect(x : 40, y: 130 + 80 * index, width: 7 * Int(info["medals"] ?? "0")!, height: 30)
            myLabel.text = info["medals"]! + "  "
            myLabel.textAlignment = .right
            myLabel.backgroundColor = UIColor(red: 12/255, green: 218/255, blue: 240/255, alpha: 0.7)
            let secondLabel: UILabel = UILabel()
            secondLabel.frame = CGRect(x : 45 + 7 * Int(info["medals"] ?? "0")!, y: 130 + 80 * index, width: 100, height: 30)
            secondLabel.text = info["name"]! + info["flag"]!
            secondLabel.textColor = .black
            view.addSubview(myLabel)
            view.addSubview(secondLabel)
            index += 1
        }
    }
    
    
}

#Preview {
    ViewController()
}
