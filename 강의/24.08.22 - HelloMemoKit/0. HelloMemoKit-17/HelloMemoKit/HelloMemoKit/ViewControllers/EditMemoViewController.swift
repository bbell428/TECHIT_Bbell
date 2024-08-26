//
//  EditMemoViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

class EditMemoViewController: BaseStackViewController {
    
    var memo: Memo?
    
    private lazy var memoTextView: UITextView = {
        let textView = UITextView()
        textView.font = .preferredFont(forTextStyle: .largeTitle)
        textView.isEditable = true
        return textView
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .memoThemeColor
        button.addAction(UIAction { _ in
            // 화면 내리자!
            self.dismiss(animated: true)
        }, for: .touchUpInside)
        return button
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.backgroundColor = .memoThemeColor
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let memo {
            memoTextView.text = memo.text
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 처음 화면 보여주자마자
        // 텍스트 편집창에 포커스를 주면
        // 키보드가 올라올 것이다
        memoTextView.becomeFirstResponder()
    }
    
    override func setupInterface() {
        super.setupInterface()
        
        
        let actionStackView = UIStackView()
        actionStackView.axis = .horizontal
        actionStackView.spacing = 10
        actionStackView.distribution = .equalSpacing
        stackView.addArrangedSubview(actionStackView)
    
        actionStackView.addArrangedSubview(cancelButton)
        actionStackView.addArrangedSubview(addButton)
        
        stackView.addArrangedSubview(memoTextView)
    }
    /*
    override func setupLayout() {
        super.setupLayout()
    }
     */
}

#Preview {
    EditMemoViewController()
}
