//
//  AddingMemoViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

class AddingMemoViewController: BaseStackViewController {
    
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
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupInterface() {
        super.setupInterface()
        
        stackView.addArrangedSubview(memoTextView)
        stackView.addArrangedSubview(addButton)
    }
    /*
    override func setupLayout() {
        super.setupLayout()
    }
     */
}

#Preview {
    AddingMemoViewController()
}
