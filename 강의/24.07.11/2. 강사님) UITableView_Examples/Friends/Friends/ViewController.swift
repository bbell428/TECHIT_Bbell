//
//  ViewController.swift
//  Friends
//
//  Created by Jongwook Park on 7/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let nations: [String] = [
        // 아시아
        "일본", "베트남", "필리핀", "인도", "중국",
        
        // 오세아니아
        "호주", "뉴질랜드",
        
        // 아메리카
        "멕시코", "미국",
        
        // 유럽
        "스위스", "스웨덴", "독일", "오스트리아", "프랑스",
        "영국", "스페인", "독일", "아이슬란드", "노르웨이", "러시아",
        "덴마크", "우크라이나"]
    
    private let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Storyboard 없이 코드만으로
        // view안에 다른 view를 만들어 얹힐 수 있다.
        /*
         let myView: UIView = UIView()
         myView.frame = CGRect(x: 100, y: 120, width: 100, height: 50)
         myView.backgroundColor = .cyan
         view.addSubview(myView)
         */
        
        // 그래서 준비된 tableView도
        // 크기를 화면 전체로 조절해서
        // ViewController의 view 위에 얹혀보자
        tableView.frame = view.bounds
        // tableView.backgroundColor = .darkGray
        view.addSubview(tableView)
        
        // TableView가 요구하는 프로토콜들이 준비되었으니
        // 필요할 때 우리를 불러달라고 지정해줘야 한다
        tableView.delegate = self
        tableView.dataSource = self
        
        // cell을 재활용하도록 미리 등록해놓기
        // 메모리를 효율적으로 관리하기 위함
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

// 여러개의 프로토콜을 따라야하는 경우라면
// 특정 프로토콜을 구현하는 부분만 extension으로 구성하는 방법도 있다

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    
    // TableView에 특정 섹션마다 몇 개의 항목이 있는지
    // 요구받으면 우리가 알려줘야 한다
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nations.count
    }
    
    // 특정 위치를 요구받으면 우리는 그 위치에 적절한
    // TableView에 일부인 Cell을 만들어서 보내줘야한다
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nation: String = nations[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Hello for section \(indexPath.section) / row \(indexPath.row)"
        cell.textLabel?.text = "\(nation)"
        
        return cell
    }
}

// Storyboard를 사용하지 않고
// 코드만으로 ViewController가 구성된다면
// Preview가 쉽게 됩니다
#Preview {
    ViewController()
}
