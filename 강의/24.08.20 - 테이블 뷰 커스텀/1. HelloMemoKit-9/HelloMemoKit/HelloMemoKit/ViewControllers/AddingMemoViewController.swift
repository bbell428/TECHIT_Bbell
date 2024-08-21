//
//  AddingMemoViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

class AddingMemoViewController: BaseViewController {
    
    private lazy var memoTextView: UITextView = {
        let textView = UITextView()
        textView.font = .preferredFont(forTextStyle: .largeTitle)
        textView.isEditable = true
        return textView
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.backgroundColor = .systemTeal
        
        button.addAction(UIAction { _ in
            
            guard !self.memoTextView.text.isEmpty else {
                print("empty!")
                return
            }
                
            print("not empty!")
            
            MemoStore.shared.addMemo(self.memoTextView.text)
            
            // 화면 내리자!
            self.dismiss(animated: true)
                
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupInterface() {
        super.setupInterface()
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(memoTextView)
        stackView.addArrangedSubview(addButton)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }

}

#Preview {
    AddingMemoViewController()
}
