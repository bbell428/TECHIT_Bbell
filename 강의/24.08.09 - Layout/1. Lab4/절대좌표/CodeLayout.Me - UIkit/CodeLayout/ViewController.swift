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
        
        //MARK: 상대 좌표
        let myView: UIView = UIView()
        myView.frame = CGRect(x: 10, y: 90, width: 375, height: 350)
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
            countryName.frame = CGRect(x: 18, y: 150 + index, width: 200, height: 30)
            countryName.font = .boldSystemFont(ofSize: 20)
            view.addSubview(countryName)
            index += 50
            
            
            let medalCount: UIView = UIView()
            medalCount.frame = CGRect(x: 65, y: 105 + index, width: 10 + (Int(graphData["medals"] ?? "" ) ?? 0), height: 20)
            medalCount.backgroundColor = UIColor.blue
            view.addSubview(medalCount)
            
            let flag: UILabel = UILabel()
            flag.text = "\(graphData["medals"] ?? "") \(graphData["flag"] ?? "")"
            flag.frame = CGRect(x: 80 + (Int(graphData["medals"] ?? "" ) ?? 0), y: 90 + index + 10, width: 200, height: 30)
            view.addSubview(flag)
        }
        
        
        
        //MARK: 절대 좌표
        // 뒷 배경
        let viewSize = view.bounds
        let backView: UIView = UIView()
        backView.frame.origin = CGPoint(x: 10, y: 450)
        backView.frame.size = CGSize(width: viewSize.width - 20, height: viewSize.height / 2.3)
        backView.backgroundColor = UIColor.gray
        view.addSubview(backView)
        
        // 제목
        let hTitleLabel2: UILabel = UILabel()
        hTitleLabel2.text = "메달 높이 막대 그래프"
        hTitleLabel2.frame.origin.x = backView.frame.origin.x + 100
        hTitleLabel2.frame.origin.y = backView.frame.origin.y + 10
        hTitleLabel2.frame.size.width = 300
        hTitleLabel2.frame.size.height = 30
        hTitleLabel2.font = .boldSystemFont(ofSize: 20)
        view.addSubview(hTitleLabel2)
        
        var index2: Int = 15
        
        for graphData in data {
            // 국가 이름
            let countryName2: UILabel = UILabel()
            countryName2.text = graphData["name"]
            countryName2.frame.origin.x = backView.frame.origin.x + CGFloat(index2)
            countryName2.frame.origin.y = backView.frame.origin.y + 330
            countryName2.frame.size.width = 100
            countryName2.frame.size.height = 30
            countryName2.font = .boldSystemFont(ofSize: 20)
            view.addSubview(countryName2)
            index2 += 60
            
            // 메달 획득 그래프
            let medalCount2: UIView = UIView()
            medalCount2.frame.origin.x = countryName2.frame.origin.x
            medalCount2.frame.origin.y = countryName2.frame.origin.y
            medalCount2.frame.size.width = 40
            medalCount2.frame.size.height = CGFloat(-(Int(graphData["medals"] ?? "") ?? 0))
            medalCount2.backgroundColor = UIColor.blue
            view.addSubview(medalCount2)
            
            // 메달 개수
            let medals2: UILabel = UILabel()
            medals2.text = "\(graphData["medals"] ?? "")"
            medals2.frame.origin.x = medalCount2.frame.origin.x + 5
            medals2.frame.origin.y = medalCount2.frame.origin.y - 30
            medals2.frame.size.width = 100
            medals2.frame.size.height = 30
            medals2.font = .boldSystemFont(ofSize: 20)
            view.addSubview(medals2)
            
            // 국기
            let flag2: UILabel = UILabel()
            flag2.text = "\(graphData["flag"] ?? "")"
            flag2.frame.origin.x = medals2.frame.origin.x
            flag2.frame.origin.y = medals2.frame.origin.y - 20
            flag2.frame.size.width = 100
            flag2.frame.size.height = 30
            flag2.font = .boldSystemFont(ofSize: 20)
            view.addSubview(flag2)
        }
    }
}


#Preview {
    ViewController()
}
