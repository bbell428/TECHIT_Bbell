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
        myView.frame = CGRect(x: 20, y: 100, width: 360, height: 300)
        myView.backgroundColor = UIColor.white
        myView.layer.borderWidth = 1.0
        myView.layer.borderColor = UIColor.black.cgColor
        // ViewController가 가진 view 프로퍼티에 서브뷰로 추가해야 화면에 보입니다
        view.addSubview(myView)
        var index : Int = 0
        for info in data {
            let myLabel: UILabel = UILabel()
            myLabel.frame = CGRect(x : 40, y: 130 + 40 * index, width: 7 * Int(info["medals"] ?? "0")!, height: 30)
            myLabel.text = info["medals"]! + "  "
            myLabel.textAlignment = .right
            myLabel.backgroundColor = getColor(index)
            let secondLabel: UILabel = UILabel()
            secondLabel.frame = CGRect(x : 45 + 7 * Int(info["medals"] ?? "0")!, y: 130 + 40 * index, width: 100, height: 30)
            secondLabel.text = info["name"]! + info["flag"]!
            secondLabel.textColor = .black
            view.addSubview(myLabel)
            view.addSubview(secondLabel)
            index += 1
        }
        
        let myView2: UIView = UIView()
        myView2.frame = CGRect(x: 20, y: 420, width: 360, height: 400)
        myView2.backgroundColor = UIColor.white
        myView2.layer.borderWidth = 1.0
        myView2.layer.borderColor = UIColor.black.cgColor
        view.addSubview(myView2)
        index = 0
        for info in data {
            let medal: Int = Int(info["medals"]!)!
            let flagLabel: UILabel = UILabel()
            flagLabel.frame = CGRect(origin: CGPoint(x: 20 + 50 * index, y: 25 + (30 - medal) * 10 ), size: CGSize(width: 30, height: 40))
            flagLabel.text = info["flag"]!
            flagLabel.textAlignment = .center
            
            let myLabel: UILabel = UILabel()
            myLabel.frame = CGRect(origin: CGPoint(x: 20 + 50 * index, y: 60 + (30 - medal) * 10 ), size: CGSize(width: 30, height: 10 * Int(info["medals"] ?? "0")!))
            
            myLabel.text = info["medals"]!
            myLabel.textAlignment = .center
            myLabel.backgroundColor = getColor(index)
            
            let nameLabel: UILabel = UILabel()
            nameLabel.frame = CGRect(origin: CGPoint(x: 20 + 50 * index, y: 355), size: CGSize(width: 40, height: 40))
            nameLabel.text = info["name"]!
            nameLabel.textColor = UIColor.black
            
            myView2.addSubview(myLabel)
            myView2.addSubview(flagLabel)
            myView2.addSubview(nameLabel)
            index += 1
        }
        
    }
    
    
}

extension ViewController {
    func getColor(_ index : Int) -> UIColor {
        switch index {
        case 0 :
            return .red
        case 1:
            return .orange
        case 2:
            return .yellow
        case 3:
            return .green
        case 4:
            return .cyan
        default:
            return .purple
        }
    }
}

#Preview {
    ViewController()
}
