//
//  ViewController.swift
//  Nations
//
//  Created by 김동경 on 2024/07/11.
//

import UIKit

class ViewController: UIViewController {
    
    let labs: [LabGroup] = [
        LabGroup(lab: "Lab1", members: ["황인영", "강승우", "김승철"]),
        LabGroup(lab: "Lab2", members: ["강희창", "김원호", "박준영", "신현우"]),
        LabGroup(lab: "Lab3", members: ["김동경", "김정원", "김종혁", "이정민"]),
        LabGroup(lab: "Lab4", members: ["권희철", "김효정", "홍재민"]),
        LabGroup(lab: "Lab5", members: ["구영진", "이다영", "이소영"]),
        LabGroup(lab: "Lab6", members: ["최승호", "김수민", "심현정", "이주노", "홍지수"])
    ]
    
    let tableView: UITableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds //테이블뷰 크기 = 현재 뷰 크기?
        tableView.delegate = self //위임 설정
        tableView.dataSource = self //위임 설정
        view.addSubview(tableView) //뷰에 테이블뷰 추가
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //메모리를 효율성
        //성능 향상
        //틀을 재사용한다. 재활용
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    //몇 개의 섹션이 있는지 정의하는 함수
    func numberOfSections(in tableView: UITableView) -> Int {
        return labs.count
    }
    
    //각 섹션의 제목을 정의하는 함수
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(labs[section].lab)"
    }
    
    //각 섹션에 몇 개의 아이템이 있는지 정의하는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labs[section].members.count
    }
    
    
    //각 아이템이 선택되었을 때 뭘 할지 정의하는 함수
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(labs[indexPath.section].members[indexPath.row])")
    }
    
    
    //각 섹션별 아이템 정의?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = ("\(labs[indexPath.section].members[indexPath.row])")
        
        return cell
    }
}




#Preview {
    ViewController()
}
