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
        
        // 추가 자료
        // 현재 전체 뷰의 크기를 알기 위한 방법
        // frame은 orgin과 size를 다 가지고 있지만
        // bounds는 size 정보만 주는 것
        let viewSize = view.bounds
        let backView: UIView = UIView()
        backView.frame.origin = CGPoint(x: 50, y: 350)
        backView.frame.size = CGSize(width: viewSize.width / 2, height: viewSize.height / 2)
        backView.backgroundColor = UIColor.gray
        view.addSubview(backView)
        
        // 다음의 코드를 이용해서 상대좌표로 만들어주세요
        
        let myView: UIView = UIView()
        myView.frame = CGRect(x: 100, y: 100, width: 200, height: 150)
        myView.backgroundColor = UIColor.orange
        view.addSubview(myView)
            
        let myLabel: UILabel = UILabel()
        myLabel.frame.origin.x = myView.frame.origin.x - 80
        myLabel.frame.origin.y = myView.frame.origin.y
        myLabel.frame.size.width = 50
        myLabel.frame.size.height = 50
        myLabel.text = "KOR"
        view.addSubview(myLabel)
        
        let myFlag: UILabel = UILabel()
        myFlag.frame.origin.x = myView.frame.origin.x + myView.frame.size.width + 20
        myFlag.frame.origin.y = myView.frame.origin.y
        myFlag.frame.size.width = 50
        myFlag.frame.size.height = 50
        myFlag.text = "🇰🇷"
        view.addSubview(myFlag)
        
    }
}

#Preview {
    ViewController()
}
