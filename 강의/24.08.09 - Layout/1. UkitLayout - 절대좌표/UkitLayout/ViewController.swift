//
//  ViewController.swift
//  HelloGraph
//
//  Created by Jongwook Park on 8/9/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 다음의 코드를 이용해서 그래프가 나오게 해주세요
        // 왼쪽에서 오른쪽으로 향하는 길이의 그래프들이 위 아래로 나열되게 해주세요!
        
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
        myView.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        myView.backgroundColor = UIColor.orange
        // ViewController가 가진 view 프로퍼티에 서브뷰로 추가해야 화면에 보입니다
        view.addSubview(myView)
        
        let myLabel: UILabel = UILabel()
        myLabel.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        myLabel.text = "KOR"
        view.addSubview(myLabel)
    }
}

#Preview {
    ViewController()
}
