//
//  AddingMemoViewController.swift
//  HelloMemoKit
//
//  Created by 김종혁 on 8/20/24.
//

import UIKit

class AddingMemoViewController: UIViewController {
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "내용을 입력하세요"
        textField.font = .systemFont(ofSize: 30)
        
        return textField
    }()
    
    let button: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("추가", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        buildInterface()
    }

    func buildInterface() {
        // AutoLayout을 쓰기 전에 SafeArea 정보 가져오기
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
       
        button.addTarget(self, action: #selector(addBtn), for: .touchUpInside)
        view.addSubview(button)
        view.addSubview(textField)
        
        // AutoLayout을 쓰겠다고 말해주기
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // label에 제약사항 추가하기
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            button.topAnchor.constraint(equalTo: textField.bottomAnchor , constant: 10),
        ])
    }
    
    @objc func addBtn() {
        let add = Memo(text: textField.text ?? "", createdAt: Date())
        MemoStore.shared.memoAdd(add)
        print("\(MemoStore.shared.memoList.last!)")
    }
}

#Preview {
    AddingMemoViewController()
}
