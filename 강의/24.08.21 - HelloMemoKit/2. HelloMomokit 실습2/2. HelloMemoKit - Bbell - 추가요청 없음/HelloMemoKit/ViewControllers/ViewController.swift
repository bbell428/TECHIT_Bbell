//
//  ViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

// 기본 예제

class ViewController: BaseStackViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.backgroundColor = .systemBlue
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "검색어를 입력하세요"
        textField.borderStyle = .line
        textField.keyboardType = .numberPad
        
        textField.addAction(UIAction { _ in
            print("editingChanged : \(textField.text ?? "(none)")")
        }, for: .editingChanged)
        
        textField.addAction(UIAction { _ in
            print("editingDidBegin : \(textField.text ?? "(none)")")
        }, for: .editingDidBegin)
        
        textField.addAction(UIAction { _ in
            print("editingDidEnd : \(textField.text ?? "(none)")")
        }, for: .editingDidEnd)
        
        textField.addAction(UIAction { _ in
            print("valueChanged : \(textField.text ?? "(none)")")
        }, for: .valueChanged)
        
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
    }

    override func setupInterface() {
        super.setupInterface()
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)
    }

}

#Preview {
    ViewController()
}
