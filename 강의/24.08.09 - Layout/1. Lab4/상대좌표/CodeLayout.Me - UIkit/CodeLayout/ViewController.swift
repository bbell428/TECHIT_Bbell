//
//  ViewController.swift
//  CodeLayout
//
//  Created by 김종혁 on 8/9/24.
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
        myView.frame = CGRect(x: 10, y: 90, width: 375, height: 375)
        myView.backgroundColor = UIColor.gray
        // ViewController가 가진 view 프로퍼티에 서브뷰로 추가해야 화면에 보입니다
        view.addSubview(myView)
        
        let hTitleLabel: UILabel = UILabel()
        hTitleLabel.text = "메달 넓이 막대 그래프"
        hTitleLabel.frame = CGRect(x: 110, y: 100, width: 200, height: 30)
        hTitleLabel.font = .boldSystemFont(ofSize: 20)
        view.addSubview(hTitleLabel)
        
        var index: Int = 0
        
        for graphData in data {
            let countryName: UILabel = UILabel()
            countryName.text = graphData["name"]
            countryName.frame = CGRect(x: 10, y: 150 + index, width: 200, height: 30)
            countryName.font = .boldSystemFont(ofSize: 20)
            view.addSubview(countryName)
            index += 50
            
            
            let medalCount: UIView = UIView()
            medalCount.frame = CGRect(x: 60, y: 105 + index, width: 10 + (Int(graphData["medals"] ?? "" ) ?? 0), height: 20)
            medalCount.backgroundColor = UIColor.blue
            view.addSubview(medalCount)
            
            let flag: UILabel = UILabel()
            flag.text = "\(graphData["medals"] ?? "") \(graphData["flag"] ?? "")"
            flag.frame = CGRect(x: 80 + (Int(graphData["medals"] ?? "" ) ?? 0), y: 90 + index + 10, width: 200, height: 30)
            view.addSubview(flag)
        }
        
        
    }


}


#Preview {
    ViewController()
}
