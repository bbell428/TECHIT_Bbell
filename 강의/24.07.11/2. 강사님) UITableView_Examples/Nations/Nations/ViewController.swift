//
//  ViewController.swift
//  Nations
//
//  Created by Jongwook Park on 7/11/24.
//

import UIKit

struct NationsGroup {
    var name: String
    var nations: [String]
}

class ViewController: UIViewController {
    
    let tableView: UITableView = UITableView()
    
    private let nations: [NationsGroup] = [
        NationsGroup(name: "아시아", nations: ["🇯🇵일본", "🇻🇳베트남", "🇵🇭필리핀", "🇮🇳인도", "🇨🇳중국"]),
        NationsGroup(name: "오세아니아", nations: ["호주", "뉴질랜드"]),
        NationsGroup(name: "아메리카", nations: ["멕시코", "미국"]),
        NationsGroup(name: "유럽", nations: ["스위스", "스웨덴", "독일", "오스트리아", "프랑스",
                                           "영국", "스페인", "독일", "아이슬란드", "노르웨이", "러시아",
                                           "덴마크", "우크라이나"]),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

// MARK: -
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 몇개의 섹션이 있는지 정의하는 함수?
    func numberOfSections(in tableView: UITableView) -> Int {
        return nations.count
    }
    
    // 각 섹션의 제목을 정의하는 함수
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(nations[section].name)"
    }

    // 각 섹션에 몇 개의 아이템이 있는지 정의하는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nations[section].nations.count
    }
    
    // 각 섹션별 아이템 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = nations[indexPath.section].nations[indexPath.row]
        
        return cell
    }
}

#Preview {
    ViewController()
}
